# cl-harfbuzz
### _Jeremiah LaRocco <jeremiah_larocco@fastmail.com>_

Common Lisp bindings to the [HarfBuzz](https://github.com/harfbuzz/harfbuzz) C API.

At some point I intend to add these bindings to QuickLisp, but until then it must be installed manually.

## Getting Started
This binding uses [cl-autowrap](https://github.com/jl2/cl-autowrap), which makes it easy to build the bindings from the source code.

Note that I've made changes to cl-autowrap that aren't yet in the upstream version.  Specifically, I've added a :language parameter to autowrap:c-include to force parsing as a specific language.  This ensures clang only looks at the C sources instead of C++.

### Install HarfBuzz
Install Harfbuzz using [the instructions](https://harfbuzz.github.io/install-harfbuzz.html) on their website.

### Get the HarfBuzz CL Bindings
In your local Lisp project directory, clone the cl-harfbuzz library:

```Bash
git clone https://github.com/jl2/cl-harfbuzz.git
```

### Load the HarfBuzz bindings in the REPL
In Slime:

```Common Lisp
(ql:quickload :harfbuzz.examples)
```

The quickload will take several seconds the first time, as autwrap needs to run c2ffi, parse the .spec files, and generate code.  Subsequent loads should be much faster.

Next, run one of the getting started examples:

```Common Lisp
(hb.examples:do-something)
```


## License
ISC

Copyright (c) 2020 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


