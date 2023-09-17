import type { Config } from "tailwindcss";

const srcRoot = "./src";

const config: Config = {
  content: [
    "pages/**/*.{js,ts,jsx,tsx,mdx}",
    "components/**/*.{js,ts,jsx,tsx,mdx}",
    "app/**/*.{js,ts,jsx,tsx,mdx}",
  ].map((path) => srcRoot + "/" + path),
  theme: {
    extend: {},
  },
  plugins: [],
  corePlugins: {
    /** @todo Enable perflight by removing this. */
    preflight: false,
  },
};

export default config;
