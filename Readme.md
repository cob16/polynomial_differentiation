# Differentiation of polynomials Code exercise

A web service in ruby that can do mathematical differentiation of polynomials

[See the acceptance_tests for examples](./spec/acceptance_tests/differente_polynomials_spec.rb)
#### Install dependency's
```bash
# gem install bundler
bundle install
```
#### Run Tests
```bash
bundle exec rspec
```
#### Run Webservice
```bash
bundle exec ruby ./requests.rb
```
#### Run linting
```bash
bundle exec rubocop
```


<details>
<summary>Full brief</summary>
Write a web service in the language of your choice that can do mathematical differentiation of polynomials:
DEFINITIONS

    A polynomial is a function of the form f(x) = a*x^b + ... where a is known as a coefficient, and b is called the exponent.
    If you have a function f(x), then its derivative is denoted by f'(x)
    Differentiating, or taking the derivate of a polynomial follows a simple formula: f'(x) = abx^(b-1)
    Differentating sums of polynomials follows the rule: If f(x) = g(x) + h(x) then f'(x) = g'(x) + h'(x)

EXAMPLES

For example, x^2 as input would give 2x^1 as output 3x^2+x+1 would give 6x+1

Input: GET /differentiate/3/2/1 would represent -> 3x^2+2x+1 Output would be: 6x+2

And for input: GET /differentiate/4/3/2/1 would represent -> 4x^3+3x^2+2x+1 Output would be: 12x^2+6x+2

A request to GET /differentiate/4/3/0/1 would represent the equation 4x^3+3x^2+0+1 and the output you should return ought to be 12x^2+6x A request to GET /differentiate/4/-5/0/1 would represent the equation 4x^3-5x^2+0+1 and the output you should return ought to be 12x^2-10x

As you may have guessed by each exponent is represented by its order in the path component, and its corresponding exponent is represented by the value of the path exponent.
</details>