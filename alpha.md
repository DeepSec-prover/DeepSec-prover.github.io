Thank you for testing the new version of DeepSec and the completely new user interface DeepSec UI.

## Download and installation

**DeepSec** can be used independently of **DeepSec UI** but the latter requires the former to be installed.
Please install both so that you can test as many feature as possible.

### Installation of DeepSec

**DeepSec** requires **OCaml > 4.05**.  It is highly recommended to install **OCaml** through `opam` instead of a native package manager, such as `apt-get` (the latest version on `apt-get may` not be the latest release of OCaml). `opam` itself may however be safely installed using your favorite package manager (see instructions for installing `opam`).
To know your current version of **OCaml**, just run `ocaml --version`.

### Upgrading OCaml using OPAM 1.x.x (Can be skipped if you already have ocaml 4.05 or newer)

1. Run `opam switch list` (The version 4.05.0 should be displayed in the list. Otherwise run first `opam update`).
2. Run `opam switch 4.05.0` (or a more recent version).
3. Follow the instructions (at the end do not forget to set the environment by running ``eval `opam config env` ``).

### Upgrading OCaml using OPAM 2.x.x (Can be skipped if you already have ocaml 4.05 or newer)

1. Run `opam switch list-available` (The version `ocaml-base-compiler 4.05.0` should be displayed in the list. Otherwise, first run `opam update`).
2. Run `opam switch create 4.05.0` (or a more recent version).
3. Follow the instructions.

### Installation of DeepSec from source

**Deepsec** requires the package **ocamlbuild** to compile which itself requires **ocamlfind**. It is important that both ocamlbuild and ocamlfind are compiled with the same version of OCaml. Running `opam install ocamlbuild` may not install ocamlfind if an instance of ocamlfind was installed on a different installation of OCaml (which sometimes happen on MacOSX). It is safer to run `opam install ocamlfind` before.
Once the alpha version has been tested, we foresee to provide an `opam` package for **DeepSec** to ease the installation.

1. Run `opam install ocamlfind` (Optional if already installed)
2. Run `opam install ocamlbuild` (Optional if already installed)
3. Run `git clone https://github.com/DeepSec-prover/deepsec.git` (with a HTTPS connexion) or `git clone git@github.com:DeepSec-prover/deepsec.git` (with a SSH connexion)
4. Inside the directory `deepsec`, run `make`
5. The executable program `deepsec` has been built.

Note that two additional executables ared compile at the same time as `deepsec`: `deepsec_worker` and `deepsec_api`. The former is used by **DeepSec** to distribute the computation on multi-core architectures and clusters of computers. The latter is used to communicate with **DeepSec UI**. Both should not be used manually nor should they be moved from the `deepsec` folder.

## Installation of DeepSec UI

**DeepSec UI** has been packaged so you don't need to compile it from the source. Just download the version according to your OS and double click. You can also directly visit [DeepSec UI Releases](https://github.com/DeepSec-prover/deepsec_ui/releases) to get the lastest version. If you need another distribution, please feel free to ask (currently no windows support...)

1. For MacOSX: [deepsec-ui-1.0.0-rc3_OSX.dmg](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_OSX.dmg)
2. For Linux:
  - Debian: [deepsec-ui-1.0.0-rc3_amd64.deb](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_amd64.deb)
  - Snapshot: [deepsec-ui-1.0.0-rc3_amd64.snap](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_amd64.snap)
  - AppImage: [deepsec-ui-1.0.0-rc3.AppImage](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3.AppImage)

To work, **DeepSec UI** requires to know the location of the executable `deepsec_api` that was installed by **DeepSec**. When **DeepSec** will be installed through `opam` in the foreseeable future, it will be added in your `PATH` environment automatically and so **DeepSec UI** will find it automatically. Thus currently, either you can add `deepsec_api` in your `PATH` or you can manually indicate to **DeepSec UI** where it is located (in the **Settings** menu of **DeepSec UI**).

## Using DeepSec UI

Using DeepSec UI should be quite intuitive. We nevertheless provide a few precisions with respect to the equivalence simulator and the display of attack trace:
1. A term #n represents a public name of the attacker.
2. The projections of tuples are displayed as Π<sub>i,j</sub>. For example, Π<sub>2,4</sub> is the second projection of the 4-tuple. When using the equivalence simulator, projections are written proj_{i,j} when inputing a recipe.
3. Axioms are displayed as ax<sub>i</sub> and should be written ax_i in the equivalence simulator when inputing a recipe.

We should find an intuitive way to explain these before the final release.


## Bug reports, feature requests, etc.

If you find a bug while testing, you can send me an [email](mailto:vincent.cheval@inria.fr) or go to the GitHub webpage of **[DeepSec](https://github.com/DeepSec-prover/deepsec/issues)** and **[DeepSec UI](https://github.com/DeepSec-prover/deepsec_ui/issues)**. Please send the error message, the .dps file and describe how the bug arised as much as you can.

If you have a feature request or if there is something that is not very intuitive, feel free to also leave a comment. This will greatly help us improve the tool.


## Known issues

We are currently aware of two issues that we are trying to solve before the full release:
1. Quitting **DeepSec UI** also terminates all the runs of **DeepSec** that were launched through **DeepSec UI** and they still appear as **In Progress** when relaunching the UI. The intended behavior is that **DeepSec** keeps running in the back ground even when **DeepSec UI** is closed. Note that this issue does not affect the runs of **DeepSec** that were launched using the command-line.
2. When using the classic semantics (option `-s classic` in command line), the memory used can increase very quickly. We are working on keeping it lower.
3. In  **DeepSec UI**, the button `redo` that appears when using the attack and equivalence simulator is currently disabled.
4. A Javascript error is trigger when quitting the application after using the simulator or display of attack. See [Issue #61](https://github.com/DeepSec-prover/deepsec_ui/issues/61)

## Thank you again for testing DeepSec and DeepSec UI !!
