With TypeScript 2.9, --resolveJsonModule allows for importing, extracting types from and generating .json files.
  // tsconfig.json
  {
      "compilerOptions": {
          "module": "commonjs",
          "resolveJsonModule": true,
          "esModuleInterop": true
      }
  }
### This syntax requires an imported helper but module 'tslib' cannot be found.ts(2354)
    In tsconfig.json, under compilerOptions.paths, add
    "tslib" : ["node_modules/tslib/tslib.d.ts"]
