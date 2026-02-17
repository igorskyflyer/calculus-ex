<div align="center">
  <img src="https://raw.githubusercontent.com/igorskyflyer/calculus-ex/main/assets/calculus-ex.png" alt="Icon of CalculusEx" width="256" height="256">
  <h1 align="center">CalculusEx</h1>
</div>

<blockquote align="center">Mathematical Modeling • Linear Programming • Compromise Programming • Decision-Making Analysis</blockquote>

<h4 align="center">
  A specialized mathematical desktop suite designed for multi-objective optimization and ranking alternatives through group utility and individual regret analysis.
</h4>

<br>

## Table of Contents

- ✨ [**Features**](#features)
- ⚙️ [**Implementation**](#implementation)
- 🎯 [**Motivation**](#motivation)
- 📝 [**Changelog**](#changelog)
- 🪪 [**License**](#license)
- 🧬 [**Related**](#related)
- 💖 [**Support**](#support)
- 👨🏻‍💻 [**Author**](#author)

<br>

## Features

- **Custom Data Management**: Support for proprietary `.cxf` binary tables with high-speed I/O, native Windows drag‑and‑drop, and CLI integration for automated file handling.
- **Analytical Engine**: Executes **Compromise Programming** and **Linear Optimization** to calculate weighted/maximum/sum deviations and generate multi-objective mathematical rankings.
- **Dynamic Grid Architecture**: Automated grid generation based on user‑defined criteria and alternatives, featuring structural editing (add/delete/reorder) and custom-rendered headers.
- **Data Entry Utilities**: Features real-time character-level validation to prevent mathematically invalid strings, population with bounded random values, and selection highlighting.
- **Multi-Format Export**: Generates styled **HTML5** reports with embedded assets and hardware-accelerated raster graphics (**JPG**, **PNG**, **BMP**) of data grids.
- **System Persistence**: Full session state recovery via Windows Registry integration, storing fonts, colors, numeric formats, and custom configuration (`.cxc`) exports.
- **Advanced UI Customization**: High-fidelity GDI rendering with 7+ theme variations, persistent font scaling, custom context menus, and a frameless window architecture.
- **Utility Suite**: Integrated search engine for grid data, session restart logic, and context-aware error handling to maintain application uptime.

<br>

## Implementation

### Computational Logic

CalculusEx implements a robust mathematical engine based on **Linear Optimization** ($LP$) and **Compromise Programming**. The software processes $m$ criteria across $n$ alternatives to derive:

- $S_{n}$ (**Group Utility**): The sum of weighted distances from the ideal solution.
- $R_{n}$ (**Individual Regret**): The maximum individual weighted distance.
- $S_{p}$ (**Compromise Ranking**): A synthesized score used to rank alternatives by mathematical preference.

### Data Management & Interoperability

- **Binary Engine**: Utilizes a proprietary binary format for data integrity and low-latency I/O.
- **Hardware Acceleration**: Employs hardware-level floating-point exception handling to maintain stability during complex singularities or divisions by zero.
- **Resource Optimization**: Stripped `Portable Executable` (PE) headers ensure a minimal memory footprint on legacy and modern Windows systems.

### UI & Performance

- **Direct Win32/GDI**: Bypasses heavy frameworks in favor of direct Win32 API calls for maximum rendering performance.
- **Adaptive Layout**: Features a dynamic UI engine that scales grid dimensions based on text-metric analysis.

<br>

## Motivation

`CalculusEx` was born from an intellectual gauntlet that had remained open for half a decade.

By _late 2014_, while Igor was already **mentoring fellow students** and managing **freelance development**, he sought a challenge that exceeded standard academic boundaries. During an **Operations Research** course, he accepted a faculty problem involving **Linear Programming** that had gone unsolved by approximately **500 students** over the preceding **five years**.

With a strict **two-week deadline**, Igor independently chose to go beyond the mathematical core and of the assignment, to architect a complete desktop suite using **Delphi** and raw **Win32 APIs**. Driven by an interest in extreme engineering, he developed a **custom GDI rendering engine**, proprietary binary formats (`.cxf` and `.cxc`), and a system for **Compromise Programming**—all while managing a full academic load. The project was a definitive success, earning a perfect **10 (A)** and providing a functional solution to a long-standing challenge that had eluded five years of predecessors.

<br>

## Changelog

The changelog is available here, [CHANGELOG.md](https://github.com/igorskyflyer/calculus-ex/blob/main/CHANGELOG.md).

<br>

## License

Licensed under the [GPLv3 license](https://github.com/igorskyflyer/calculus-ex/blob/main/LICENSE).

<br>

## Support

<div align="center">
  I work hard for every project, including this one and your support means a lot to me!
  <br>
  Consider buying me a coffee. ☕
  <br>
  <br>
  <a href="https://ko-fi.com/igorskyflyer" target="_blank"><img src="https://raw.githubusercontent.com/igorskyflyer/igorskyflyer/main/assets/ko-fi.png" alt="Donate to Igor Dimitrijević (igorskyflyer)" width="180" height="46"></a>
  <br>
  <br>
  <em>Thank you for supporting my efforts!</em> 🙏😊
</div>

<br>

## Related

[@igorskyflyer/unc-path](https://www.npmjs.com/package/@igorskyflyer/unc-path)

> _🥽 Provides ways of parsing UNC paths and checking whether they are valid. 🎱_

<br>

[@igorskyflyer/registry-apppaths](https://www.npmjs.com/package/@igorskyflyer/registry-apppaths)

> _🪀 A Node.js module for reading the AppPaths registry key on Windows. Useful for retrieving applications that can be launched from the command prompt. 🗃_

<br>

[@igorskyflyer/rawelement](https://www.npmjs.com/package/@igorskyflyer/rawelement)

> _🐯 A utility that lets you manipulate HTML elements, their attributes and innerHTML as strings, on the go and then render the modified HTML. Very useful in SSG projects. 💤_

<br>

[@igorskyflyer/clone](https://www.npmjs.com/package/@igorskyflyer/clone)

> _🧬 A lightweight JavaScript utility allowing deep copy-by-value of nested objects, arrays and arrays of objects. 🪁_

<br>

[@igorskyflyer/mp3size](https://www.npmjs.com/package/@igorskyflyer/mp3size)

> _🧮 Calculates an estimated file size of Mp3 files. 🎶_

<br>

## Author

Created by **Igor Dimitrijević** ([_@igorskyflyer_](https://github.com/igorskyflyer/)).
