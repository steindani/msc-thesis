[PDF output](https://github.com/steindani/msc-thesis/raw/master/StD-TDK-2016.pdf)

# Graph-Based Source Code Analysis of JavaScript Repositories
This is the repository of my Master's thesis work at the Budapest University of Technology and Economics, titled _Graph-Based Source Code Analysis of JavaScript Repositories_ and the Scientific Students' Association Report titled _Graph-Based Source Code Analysis of Dynamically Typed Languages_.

[The source code of the prototype framework is also open-source.](https://github.com/FTSRG/codemodel-rifle)

## Abstract
We are surrounded by more and more complex software that operate in mission-critical systems. Even small errors in these software can lead to serious consequences that may be too expensive to let happen. Static analysis is a proven approach for detecting mistakes in the source code early in the development cycle. Since static analysis does not compile or run the code, it can be applied at an early state of development. With static analysis it is possible to check whether the software conforms to the coding rules and requirements, and to locate potential errors.

While multiple static analysis tools exist for general purpose programming languages and these are generally part of the continuous integration systems, this is not the case with JavaScript. Due to the dynamically typed nature of this language there are only a few tools available for JavaScript codebases. Also, there are currently no tools available jointly providing lower level and global static analysis, finding control flows, and providing integration points for continuous integration systems.

In this report I design, implement and evaluate a framework extending the continuous integration workflow of large and frequently changing JavaScript repositories with configurable static analysis tools and techniques. Due to the novel approach of the framework, its users can express requirements easier and they are able to check global level requirements more efficiently.
