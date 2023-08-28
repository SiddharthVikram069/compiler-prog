<img src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif">

<h1 align="center"><b>Simple Parser </b><picture><img src = "https://github.com/0xAbdulKhalid/0xAbdulKhalid/raw/main/assets/mdImages/about_me.gif" width = 50px></picture></h1>

<!-- snake -->
<div align="center">
  <img  src="https://github.com/1999AZZAR/1999AZZAR/blob/main/resources/img/grid-snake.svg"
       alt="snake" /></a>
</div>

<!-- How to use the project -->
## Getting Started

This is an example on how to set your project locally, and modify it 

### Prerequisites 

You need to have flex and bison installed in your local machine to modify and debug the project
* flex 
  ```sh
  sudo apt install flex 
  ```
* bison
  ```sh
  sudo apt install bison
  ```

### Usage

If you don't want to modify the project, all of the files have been already made, you just need to use the following command to generate the executable 
  ```sh
  gcc -o parser lex.yy.c y.tab.c
  ```
This will save the output in the executable name parser, you may not use the -o flag and remove the name of the executable and the parser would be saved
in the a.out file

Now, to use the parser with a specific text file, the following command must be used 
  ```sh
  ./executable_name <text_file
  ```
The parser will give the output of whether the parsing is successful or not 
  ```sh
  parsing successful
  ```
The rules of the language are already defined unless you modify them, refer to the current rules from the rules file.

### Modification and debugging 

If you need to use these sample parser to make your own parser, you need to have some knowledge of flex and bison frameworks. You can modify the tokens in the
scanner.l file. To modify the grammar rules of the language, you can see the parser.y file, this file also contains the operator precedence. <br>
After you are done with the modifications, use the following commands to create new lex.yy.c and y.tab.c file to make the executable

  ```sh
  flex scanner.l
  yacc -d parser.y
  ```
With modifications you may encounter a lot of shift-reduce and reduce-reduce conflicts, that means your grammar is incorrect, use the following command to 
generate a file named y.output, this file contains a readable version of the finite automaton of the grammar, so we can figure out the cause of the 
conflicts 

  ```sh
  yacc -v parser.y
  ```

<!-- Resources Used -->
<div id="user-content-toc">
  <ul align="left">
    <summary><h2 style="display: inline-block">Resources Used👨🏻‍💻</h2></summary>
  </ul>
</div>

- flex(Fast Lexical Analyzer Generator), I don't know why they didn't name it flax, I guess they just wanted to FLEX!!
- Bison, a simple parser generator that works on C(you might see it by the name of Yacc)
- Introduction to compiler and language design
- The C language

## Roadmap
- [x] Define the tokens and make the scanner
- [x] Make the grammar of the language
- [x] generate the parser by combining with scanner
- [x] Make the Abstract Syntax Tree <i>(completed in test branch)</i>
  - [x] Make the header files for nodes and constructing functions 
  - [x] Incorporate the constructing functions in the parser.y file

## Contributing 

Contributions are hugely appreciated, I would suggest not including fairly high level of compiler optimisations, I want this project to be a stepping stone 
for begginers in compiler and language design. <br> You can add new tokens, try to add new concepts to the language like pointers and bitwise operators(good first issue).
You can also need some new data structure if you want, something like a matrix data structure in which addition and multiplication are supported<br>

For any suggestion, fork the project and generate a pull request, make sure pull requests are accompanied by a brief explaination, I will review it.


## <b> Contact Info</b><img src="https://github.com/0xAbdulKhalid/0xAbdulKhalid/raw/main/assets/mdImages/handshake.gif" width ="80">
<br>
<div align='left'>

<ul>

<li>
<a href="https://www.linkedin.com/in/siddharth-vikram-523835219/" target="_blank">
<img src="https://img.shields.io/badge/linkedin:  Siddharth Vikram-%2300acee.svg?color=405DE6&style=for-the-badge&logo=linkedin&logoColor=white" alt=linkedin style="margin-bottom: 5px;"/>
</a>
</li>

<br>

<li>
<a href="mailto:Siddharth.Vikram@iiitb.ac.in" target="_blank">
<img src="https://img.shields.io/badge/gmail:  Siddharth Vikram-%23EA4335.svg?style=for-the-badge&logo=gmail&logoColor=white" t=mail style="margin-bottom: 5px;" />
</a>
</li>
	
</ul>
</div>


