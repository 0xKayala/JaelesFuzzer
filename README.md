<h1 align="center"> 
  JaelesFuzzer = Jaeles + Paramspider
  <br>
</h1>

<p align="center">
<a href="https://github.com/0xKayala/JaelesFuzzer/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://github.com/0xKayala/JaelesFuzzer/releases"><img src="https://img.shields.io/github/v/release/0xkayala/NucleiFuzzer.svg"></a>
<a href="https://twitter.com/0xKayala"><img src="https://img.shields.io/twitter/follow/0xKayala.svg?logo=twitter"></a>
</p>

`JaelesFuzzer` is an automation tool that combines `ParamSpider` and `Jaeles Scanner` to enhance web application security testing. It uses `ParamSpider` to identify potential entry points and `Jaeles Scanner` fuzzing signatures to scan for vulnerabilities. `JaelesFuzzer` streamlines the process, making it easier for security professionals and web developers to detect and address security risks efficiently. Download `JaelesFuzzer` to protect your web applications from vulnerabilities and attacks.

**Note:** `Jaeles` + `Paramspider` = `JaelesFuzzer` <br><br>
**Important:** Make sure the tools `Jaeles`, `httpx` & `Paramspider` are installed on your machine and executing correctly to use the `JaelesFuzzer` without any issues.

### Tools included:
[ParamSpider](https://github.com/0xKayala/ParamSpider) `git clone https://github.com/0xKayala/ParamSpider.git`<br><br>
[Jaeles](https://github.com/jaeles-project/jaeles) `git clone https://github.com/jaeles-project/jaeles.git`

### Signatures:
[Jaeles Fuzzing Signatures](https://github.com/0xKayala/jaeles-signatures) `git clone https://github.com/0xKayala/jaeles-signatures.git`


## Screenshot


## Output


## Usage

```sh
jf -h
```

This will display help for the tool. Here are the options it supports.

```console
JaelesFuzzer is a Powerful Automation tool for detecting XSS, SQLi, SSRF, Open-Redirect, etc. vulnerabilities in Web Applications

Usage: /usr/bin/jf [options]

Options:
  -h, --help              Display help information
  -d, --domain <domain>   Domain to scan for XSS, SQLi, SSRF, Open-Redirect..etc vulnerabilities
  -f, --file <filename>   File containing multiple domains/URLs to scan
```  

## Installation:

To install `JaelesFuzzer`, follow these steps:

```
git clone https://github.com/0xKayala/JaelesFuzzer.git && cd JaelesFuzzer && sudo chmod +x install.sh && ./install.sh && jf -h && cd ..
```

## Examples:

Here are a few examples of how to use NucleiFuzzer:

- Run `JaelesFuzzer` on a single domain:

  ```sh
  jf -d example.com
  ```

- Run `JaelesFuzzer` on multiple domains from a file:

  ```sh
  jf -f file.txt
  ```

## Practical Demonstration:

For a Practical Demonstration of the JaelesFuzzer tool see the below video 👇 <br>

[<img src="https://img.youtube.com/vi/2K2gTCHt6kg/hqdefault.jpg" width="600" height="300"/>](https://www.youtube.com/embed/2K2gTCHt6kg)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=0xKayala/JaelesFuzzer&type=Date)](https://star-history.com/#0xKayala/JaelesFuzzer&Date)

## Contributing

Contributions are welcome! If you'd like to contribute to `JaelesFuzzer`, please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes and commit them.
4. Submit a pull request.

Made by
`Satya Prakash` | `0xKayala` \

A `Security Researcher` and `Bug Hunter` \

## Connect with me:
<p align="left">
<a href="https://twitter.com/0xkayala" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="0xkayala" height="30" width="40" /></a>
<a href="https://linkedin.com/in/0xkayala" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="0xkayala" height="30" width="40" /></a>
<a href="https://instagram.com/0xkayala" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="0xkayala" height="30" width="40" /></a>
<a href="https://medium.com/@0xkayala" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/medium.svg" alt="@0xkayala" height="30" width="40" /></a>
<a href="https://www.youtube.com/@0xkayala" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/youtube.svg" alt="0xkayala" height="30" width="40" /></a>
</p>

## Support me:
<p><a href="https://www.buymeacoffee.com/0xKayala"> <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="0xKayala" /></a></p><br><br>
