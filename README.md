# artificial-adapter-template

![image](https://user-images.githubusercontent.com/82409344/157488538-fdb2dc19-fee5-4910-969a-92afc42cfb80.png)

## Tooling configuration

### Formatting

[`yapf`](https://github.com/google/yapf) is used for automatic formatting.

*Reasoning:* Comparing `autopep8`, `yapf`, and `black`. `yapf` was chosen because `autopep8` development has slowed and it is missing support for some async features. `black` is very prescriptive, and less flexible than `yapf`. `yapf` is what I believe the best balance between functionality and flexibility

### Linting

[`flake8`] is used for linting, it has an extensive plugin network and is configurable and fast.
[`pep8-naming`] is a `flake8` plugin that ensures PEP-8 naming conventions. Patterns can be ignored in

### Type Checking

[`pyright`](https://github.com/microsoft/pyright) is Microsoft's typechecker, it is used as the backend for VSCode and `pylance` and is actively developed and maintained.



[`mypy`](https://mypy.readthedocs.io/en/stable/)
