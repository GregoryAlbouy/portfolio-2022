import path from "path";
import { mkdirSync, existsSync, statSync } from "fs";

import esbuild from "esbuild";
import copyStaticFilesPlugin from "esbuild-copy-static-files";
import elmPlugin from "esbuild-plugin-elm";
import { sassPlugin } from "esbuild-sass-plugin";
import postcss from "postcss";
import postcssPresetEnv from "postcss-preset-env";

enum Directory {
  SOURCE = "./src",
  OUTPUT = "./dist",
  STATIC = "./static",
}

function pathFromSource(localPath: string) {
  return path.resolve(Directory.SOURCE, localPath);
}

function getBuildOptions({
  production,
  watch,
}: {
  production: boolean;
  watch: boolean;
}): esbuild.BuildOptions {
  return {
    entryPoints: {
      app: pathFromSource("app.ts"),
      "assets/style/main": pathFromSource("scss/main.scss"),
    },
    bundle: true,
    outdir: Directory.OUTPUT,
    minify: production,
    watch,
    sourcemap: !production && "inline",
    plugins: [
      copyStaticFilesPlugin({
        src: Directory.STATIC,
        dest: Directory.OUTPUT,
      }),
      elmPlugin({
        debug: !production,
        optimize: production,
        clearOnWatch: watch,
      }),
      sassPlugin({
        type: "css",
        sourceMap: !production,
        async transform(source: string, _: string) {
          const { css } = await postcss([
            postcssPresetEnv({ stage: 2 }),
          ]).process(source);
          return css;
        },
      }),
    ],
  };
}

function checkOrCreateOutputDirectory() {
  const outdir = Directory.OUTPUT;

  if (!existsSync(outdir)) {
    mkdirSync(outdir);
  }

  if (!statSync(outdir).isDirectory()) {
    throw new Error(
      `${outdir} is defined as output directory but is not a directory`
    );
  }
}

(async function main() {
  const production = process.env.NODE_ENV === "production";
  const watch = process.argv.includes("--watch");
  const buildOptions = getBuildOptions({ production, watch });

  try {
    checkOrCreateOutputDirectory();
    await esbuild.build(buildOptions);
  } catch (error: unknown) {
    console.error(error);
    process.exit(1);
  }
})();
