# LaTeX Documentations

## Compiler/Interpreter
### Synopsis/Syntax
> TBC

### Parameters
> TBC

### Usage
> TBC

## Documentation

### Symbols/Delimiters
+ `$<pattern>$`   : Everything specified inside will be displayed inline
+ `$$<pattern>$$` : Everything specified inside will be displayed in a new paragraph
+ `\(...\)        : Write inline math; Same as using `$...$`

### Scientific/Mathematical Formula and Symbols
- Symbols
    - ^ : Carot; Represents power operator; i.e. x to the power of n ($x^n$)
- Special General Symbol/Keywords
    - \dots  : Display 3 dots to the right
    - \ldots : Display 3 dots to the left
    - \verb  : Display the equation/command as a literal
- Special Mathematical Symbol/Keywords/Operations
    - \frac{numerator}{denominator}  : To display a fraction
    - \int            : To display an Integral; 
    - \limits         : Enable display a limit at the top (When required; i.e. with a Sigma/Summation equation)
    - \nolimits       : The negative/opposite of `\limits`; When used with a Sigma/Summation equation, it is a superscript
    - \oint           : To display a loop integral
    - \prod           : To display a Product Expression (Multiply instead of Sum) (Big Pi)
    - \quad           : To display a Quadratic Equation
    - \sqrt{equation} : Wrap the entire equation within a Square Root
    - \sum            : To display a Summation Expression (Big Sigma)
    - _<subscript>    : To display a subscript (bottom right corner)
    - _{subscript-equation}^superscript : To display both a subscript and a superscript (top right corner); Used for equations like a Sum, or a Sigma
- Binary Operators
    - \times          : Multiply; Times 'X' 
    - \otimes         : XOR multiplicative
    - \oplus          : XOR Additive
    - \cup            : Union
    - \cap            : Intersect
- Relation Operators
    - <         : Less Than
    - >         : More Than
    - \subset   : Is a Subset; Right-facing C
    - \supset   : Is a Superset; Left-facing C
    - \subseteq : Is a complete Subset; Right-facing C with an Equal
    - \supseteq : Is a complete Superset; Left-facing C with an Equal
- Greek Symbol
    - \alpha      : To display a small alpha symbol
    - \beta       : To display a small beta symbol
    - \delta      : To display a small delta symbol; Generally represents 'Change' or 'Difference'
    - \epsilon    : To display a small epsilon
    - \gamma      : To display a small gamma symbol
    - \lambda     : To display a small lambda symbol
    - \mu         : To display a small mu symbol; Generally represents 'Mean' in Statistics and Probability
    - \psi        : To display a small Psi symbol
    - \rho        : To display a small rho symbol
    - \sigma      : To display a small Sigma symbol
    - \Sigma      : To display a Big Sigma symbol
    - \varepsilon : To display a variance Epsilon symbol

### Special Syntax
- \documentclass{article} : To define the document article name
- \begin{type} : To define the beginning of a type
    - Types
        + displaymath : To begin display math mode
        + document : To begin writing a document/paragraph
        + equation : To begin writing an equation in a new paragraph
        + math     : To begin writing maths equations in-line
        + quote    : To begin writing a quote
- \end{type} : To define the end/closing of a type
    - Types
        + displaymath : To end/close display math mode
        + document : To end/close a document/paragraph
        + equation : To finish writing the equation
        + math     : To finish writing maths equations in-line
        + quote    : To end/close a quote
- \pagebreak : Trigger a pagebreak when printing/exporting/converting to PDF
- \usepackage{package-name} % : To import a package from the LaTeX package manager

### Usage
- Display Formula (x^2+1) inline: `$x^2+1$`
    $x^2+1$

- Display Formula (x^2+1) in a new paragraph: `$$x^2+1$$`
    $$x^2+1$$

## Wiki

### Snippets and Examples
- Typical Syntax/Structure
    ```latex
    \documentclass{article}
    \begin{document}
        \[ your Body Here \]
    \end{document}
    ```

## Resources

## References
+ [PhysicsRead - LaTeX Sigma Symbol](https://www.physicsread.com/latex-sigma-symbol/)
+ [Overleaf - LaTeX - Mathematical Expressions](https://www.overleaf.com/learn/latex/Mathematical_expressions)

## Search Queries
### Google
+ Latex write sigma
+ Latex write mathematical equations

## Remarks
