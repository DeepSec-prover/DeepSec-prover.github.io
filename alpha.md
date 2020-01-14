Thank you for testing the new version of DeepSec and the completely new user interface DeepSec UI.

## Download and installation

**DeepSec** can be used independently of **DeepSec UI** but the latter requires the former to be installed.
Please install both so that you can test as many feature as possible.

### Installation of DeepSec

**DeepSec** requires **OCaml > 4.05** (the current latest version is 4.09 if i'm not mistaken).  It is highly recommended to install **OCaml** through `opam` instead of a native package manager, such as `apt-get` (the latest version on `apt-get may` not be the latest release of OCaml). `opam` itself may however be safely installed using your favorite package manager (see instructions for installing `opam`).
To know your current version of **OCaml**, just run `ocaml --version`.

### Upgrading Ocaml using OPAM 1.x.x (Can skip if you already have ocaml 4.05 or newer)

1. Run `opam switch list` (The version 4.05.0 should be displayed in the list. Otherwise run first `opam update`)
2. Run `opam switch 4.05.0` (or a more recent version)
3. Follow the instructions (at the end do not forget to set the environment by running ``eval `opam config env` ``)

### Upgrading Ocaml using OPAM 2.x.x (Can skip if you already have ocaml 4.05 or newer)

1. Run `opam switch list-available` (The version `ocaml-base-compiler 4.05.0` should be displayed in the list. Otherwise run first `opam update`)
2. Run `opam switch create 4.05.0` (or a more recent version)
3. Follow the instructions

### Installation of DeepSec from source

**Deepsec** requires the package **ocamlbuild** to compile which itself requires **ocamlfind**. It is important that both ocamlbuild and ocamlfind are compiled with the same version of Ocaml. Running `opam install ocamlbuild` may not install ocamlfind if an instance of ocamlfind was installed on a different installation of Ocaml (which sometimes happen on MacOSX). It's safer to run `opam install ocamlfind` before.
Once the alpha is finish, we'll make a `opam` package for **DeepSec** so the installation will be easier.

1. Run `opam install ocamlfind` (Optional if already installed)
2. Run `opam install ocamlbuild` (Optional if already installed)
3. Run `git clone https://github.com/DeepSec-prover/deepsec.git` (with a HTTPS connexion) or `git clone git@github.com:DeepSec-prover/deepsec.git` (with a SSH connexion)
4. Inside the directory `deepsec`, run `make`
5. The executable program `deepsec` has been built.

Note that two executable programs are compile at the same time as `deepsec`: `deepsec_worker` and `deepsec_api`. The former is used by **DeepSec** to distribute the computation through multi-core architectures and clusters of computers. The latter is used to communicate with **DeepSec UI**. Both should not be used manually nor should they be moved from the `deepsec` folder.

## Installation of DeepSec UI

**DeepSec UI** has been packaged so you don't need to compile it from the source. Just download the version according to your OS and double click.

1. For MacOSX : <https://members.loria.fr/VCheval/deepsec_alpha/DeepSec_UI_alpha_OSX.dmg>
2. For Linux: <https://members.loria.fr/VCheval/deepsec_alpha/DeepSec_UI_alpha_Linux.dmg>

To work, **DeepSec UI** requires to know where is located the executable `deepsec_api` that was installed by **DeepSec**. When **DeepSec** will be installed through `opam` in the foreseeable future, it will be added in your `PATH` environment automatically and so **DeepSec UI** will find it itself. Thus currently, either you can add `deepsec_api` in your `PATH` or you can manually indicate to **DeepSec UI** where it is located (in the **Settings** menu of **DeepSec UI**).

## Using DeepSec UI

If we have done our job correctly, using DeepSec UI should be quite intuitive. Small precision with respect to the equivalence simulator and the display of attack trace:
1. A term `#n` represents a public name of the attacker
2. The projections of tuples are displayed as `Π<sub>i,j</sub>`. For example, `Π<sub>2,4</sub>` is the second projection of the 4-tuple. When using the equivalence simulator, projections should be written 'proj_{i,j}' when inputing a recipe
3. Axioms are displayed as `ax<sub>i</sub>` and should be written `ax_i` in the equivalence simulator when inputing a recipe.

We should find an intuitive way to explain these before the final realease.


## Bug report, feature request, etc.

If you find a bug while testing, you can send me an [email](mailto:vincent.cheval@inria.fr) or go to the GitHub webpage of **[DeepSec](https://github.com/DeepSec-prover/deepsec/issues)** and **[DeepSec UI](https://github.com/DeepSec-prover/deepsec_ui/issues)**. Please send the error message, the .dps file and describe how the bug arised as much as you can.

If you have a feature request or if there is something that is not very intuitive, feel free to also leave a comment. That will help us improve the tool.


## Known issues

We are currently aware of two issues that you're trying to solve before the full release:
1. Quitting **DeepSec UI** also terminates all the runs of **DeepSec** that were launch through **DeepSec UI** and they still appear as **In Progress** when relaunching the UI. The intended behavior is that **DeepSec** keeps running in the back ground even when **DeepSec UI** is closed. Note that this issue does not affect the runs of **DeepSec** that were launched using command-line.
2. When using the classic semantics (option `-s classic` in command line), the memory used can increase very rapidly. We're working on keeping it lower for the next patch.

## Thank you again for testing DeepSec and DeepSec UI !!
