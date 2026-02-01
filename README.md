<div align="center">
  <img src="https://raw.githubusercontent.com/igorskyflyer/calculus-ex/main/assets/calculus-ex.png" alt="Icon of CalculusEx" width="256" height="256">
  <h1 align="center">CalculusEx</h1>
</div>

<br>

<div align="center">
  <code>CalculusEx</code> is a specialized mathematical software for desktop designed for mathematical modeling and decision-making through <strong><em>Linear Programming</em></strong> and <strong><em>Compromise Programming</em></strong> methods. It facilitates the resolution of complex multi-objective problems by identifying the optimal balance between group utility and individual regret.
</div>

<br>
<br>

## 📃 Table of Contents

- [**Motivation**](#-motivation)
- [**Features**](#-features)
- [**Implementation**](#-implementation)
  - [**Computational Logic**](#computational-logic)
  - [**Data Management & Interoperability**](#data-management--interoperability)
  - [**Precision & Validation Architecture**](#precision--validation-architecture)
  - [**Operational Efficiency**](#operational-efficiency)
- [**Technical Summary**](#-technical-summary)
- [**Changelog**](#-changelog)
- [**Support**](#-support)
- [**License**](#-license)
- [**Related**](#-related)
- [**Author**](#-author)

<br>

## 🧠 Motivation

`CalculusEx` was born from an intellectual gauntlet.

During his college years, while Igor was already balancing freelance development and teaching programming to fellow students, he was presented with a challenge by his professor: to develop a functional solver for complex equations using the `Linear Programming` method.
The task was notorious; the professor revealed that in the **five** years since he had introduced the challenge, no student had been able to successfully solve it.
Igor didn't just solve the mathematical core, he transformed the challenge into a showcase of extreme engineering. He delivered a comprehensive software suite featuring custom binary formats, a bespoke GDI-rendered UI, and deep system-level optimizations. The result was a definitive success: Igor was awarded a 10 (A), receiving high praise from the professor for a solution that had eluded his predecessors for half a decade.

<br>

## 🤖 Features

- 📂 **custom data format support** - import and export proprietary `.cxf` binary tables, plus file drag‑and‑drop and command‑line file open

- 🌐 **multi‑format export** - save grids as `HTML` (styled) or as `JPG`/`PNG`/`BMP` images, with embedded icons in `HTML`

- 📊 **dynamic grid management** - generate grids from user‑defined criteria/alternatives, auto‑label entries, adjust dimensions, format numbers, and store layout/appearance preferences

- 🎲 **data entry utilities** - populate with random values within set bounds, clear contents with confirmation, restrict invalid input

- 🛠️ **structural editing** - add, delete, or reorder criteria and alternatives, highlight selections, and custom‑render grid cells for headers/states

- 📈 **analytical computation** - perform compromise programming analysis, calculate weighted/maximum/sum deviations, and present results in detailed, list, or ranking views

- 🖥️ **user interaction enhancements** - search grid via Find dialog, toggle fullscreen, adjust font size persistently, and show context‑aware menus

- 💾 **session persistence** - save fonts, colors, fill ranges, and formatting in the windows registry for auto‑restoration

- 🧰 **utility functions** - capture grid as an image, open app website, show about dialog, restart app from menu, and handle errors gracefully

- ⚙️ **highly-customizable** - configure colors, fonts, numeric format, fill range, and sound preferences, with options to import/export `.cxc` configuration files, reset to defaults, and save all changes to the registry

<br>

## 🧠 Implementation

### Computational Logic

`CalculusEx` implements a robust mathematical engine based on **Linear Optimization** (_LP_) and **Compromise Programming**. The software is engineered to process **$m$** criteria across **$n$** alternatives to derive:

- **$S_{n}$** (_Group Utility_): the sum of weighted distances from the ideal solution
- **$R_{n}$** (_Individual Regret_): the maximum individual weighted distance
- **$S_{p}$** (_Compromise Ranking_): a final synthesized score used to rank alternatives in order of mathematical preference

### Data Management & Interoperability

- proprietary binary engine: high-speed I/O via `.cxf` binary table format for data integrity
- cross-platform reporting: generates styled `HTML5` reports with embedded visual assets for browser-based review
- visual documentation: built-in hardware-accelerated capture for exporting data grids as `PNG`, `JPG`, or `BMP` images
- `CLI` integration: support for command-line arguments and native Windows drag-and-drop for automated file handling

### Precision & Validation Architecture

- input sanitization: real-time, character-level validation prevents the entry of mathematically invalid strings and ensures data consistency before calculation
- computational stability: implements hardware-level floating-point exception handling to maintain application uptime during complex singularities or divisions by zero
- analytical search: context-aware search engine that maps mathematical keys directly to the visual data coordinate system

### Operational Efficiency

- resource-light execution: optimized via stripped `Portable Executable` (PE) headers to ensure a minimal memory footprint and high-speed execution on legacy and modern Windows systems
- persistence & configuration: full session state recovery via Windows `Registry` integration and `.cxc` configuration export for standardized environment deployment
- adaptive interface: dynamic UI engine that automatically scales layout and grid dimensions based on text-metric analysis and user-defined numeric formatting

<br>

## 🚀 Technical Summary

**Environment**: `Win32` (_Native_)  
**Development Platform**: `Delphi` / `Object Pascal`  
**Output Formats**: _custom binary file_ (`.cxf`), _custom config file_ (`.cxc`), _Web_ (`HTML`), _raster graphics_ (`PNG`, `JPG`, `BMP`)  
**Optimization Strategy**: _direct_ `Win32 API` calls and `GDI` rendering for maximum performance and low-latency `UI` response.

<br>

## 📝 Changelog

📑 The changelog is available here, [CHANGELOG.md](https://github.com/igorskyflyer/calculus-ex/blob/main/CHANGELOG.md).

<br>

## 🪪 License

Licensed under the [GPLv3 license](https://github.com/igorskyflyer/calculus-ex/blob/main/LICENSE).

<br>

## 💖 Support

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

## 🧬 Related

[@igorskyflyer/unc-path](https://www.npmjs.com/package/@igorskyflyer/unc-path)

> _🥽 Provides ways of parsing UNC paths and checking whether they are valid. 🎱_

<br>

[@igorskyflyer/registry-apppaths](https://www.npmjs.com/package/@igorskyflyer/registry-apppaths)

> _🪀 A Node.js module for reading the AppPaths registry key on Windows. Useful for retrieving applications that can be launched from the command prompt. 🗃_

<br>

[@igorskyflyer/rawelement](https://www.npmjs.com/package/@igorskyflyer/rawelement)

> _🐯 A utility that lets you manipulate HTML elements, their attributes and innerHTML as strings, on the go and then render the modified HTML. Very useful in SSG projects. 💤_

<br>

[@igorskyflyer/node-clone-js](https://www.npmjs.com/package/@igorskyflyer/node-clone-js)

> _🧬 A lightweight JavaScript utility allowing deep copy-by-value of nested objects, arrays and arrays of objects. 🪁_

<br>

[@igorskyflyer/mp3size](https://www.npmjs.com/package/@igorskyflyer/mp3size)

> _🧮 Calculates an estimated file size of Mp3 files. 🎶_

<br>

## 👨🏻‍💻 Author

Created by **Igor Dimitrijević** ([_@igorskyflyer_](https://github.com/igorskyflyer/)).
