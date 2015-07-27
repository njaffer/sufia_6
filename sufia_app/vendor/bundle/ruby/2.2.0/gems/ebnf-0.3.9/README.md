# EBNF [![Build Status](https://secure.travis-ci.org/gkellogg/ebnf.png?branch=master)](http://travis-ci.org/gkellogg/ebnf)


[EBNF][] parser and generic parser generator.

## Description
This is a [Ruby][] implementation of an [EBNF][] and [BNF][] parser and parser generator.
It parses [EBNF][] grammars to [BNF][], generates [First/Follow and Branch][] tables for
[LL(1)][] grammars, which can be used with the stream [Tokenizer][] and [LL(1) Parser][].

Of note in this implementation is that the tokenizer and parser are streaming, so that they can
process inputs of arbitrary size.

## Usage
### Parsing an LL(1) Grammar

    require 'ebnf'

    ebnf = EBNF.parse(File.open(./etc/ebnf.bnf))

Output rules and terminals as S-Expressions, Turtle or EBNF

    puts ebnf.to_sxp
    puts ebnf.to_ttl
    puts ebnf.to_ebnf

Transform EBNF to BNF (generates sub-productions using `alt` or `seq` from `plus`, `star` or `opt`)

    ebnf.make_bnf

Generate [First/Follow][] rules for BNF grammars

    ebnf.first_follow(start_tokens)

Generate Terminal, [First/Follow and Branch][] tables as Ruby for parsing grammars

    ebnf.to_ruby

Generate formatted grammar using HTML (requires [Haml][Haml] gem)

    ebnf.to_html

### Creating terminal definitions and parser rules to parse generated grammars

The parser is initialized to callbacks invoked on entry and exit
to each `terminal` and `production`. A trivial parser loop can be described as follows:

    require 'ebnf/ll1/parser'
    require 'meta'

    class Parser
      include Meta

      terminal(:SYMBOL, /([a-z]|[A-Z]|[0-9]|_)+/) do |prod, token, input|
        # Add data based on scanned token to input
        input[:symbol] = token.value
      end

      start_production(:rule) do |input, current, callback|
        # Process on start of production
        # Set state for entry into recursed rules through current

        # Callback to parser loop with callback
      end

      production(:rule) do |input, current, callback|
        # Process on end of production
        # return results in input, retrieve results from recursed rules in current

        # Callback to parser loop with callback
      end

      def initialize(input)
        parser_options = {
          :branch => BRANCH,
          :first => FIRST,
          :follow => FOLLOW
        }
        parse(input, start_symbol, parser_options) do |context, *data|
          # Process calls from callback from productions

        rescue ArgumentError, RDF::LL1::Parser::Error => e
          progress("Parsing completed with errors:\n\t#{e.message}")
          raise RDF::ReaderError, e.message if validate?
        end


## EBNF Grammar
The [EBNF][] variant used here is based on [W3C](http://w3.org/) [EBNF][] (see {file:etc/ebnf.ebnf EBNF grammar}) as defined in the
[XML 1.0 recommendation](http://www.w3.org/TR/REC-xml/), with minor extensions.

Parsing this grammar yields an S-Expression version: {file:etc/ebnf.ll1.sxp}.

## Example parser
For an example parser built using this gem, see {file:examples/ebnf-parser/README EBNF Parser example}. This example creates a parser for the [EBNF][] grammar which generates the same Abstract Syntax Tree as the built-in parser in the gem.

##  Acknowledgements
Much of this work, particularly the generic parser, is inspired by work originally done by
Tim Berners-Lee's Python [predictive parser](http://www.w3.org/2000/10/swap/grammar/predictiveParser.py).

The EBNF parser was inspired by Dan Connolly's
[EBNF to Turtle processor](http://www.w3.org/2000/10/swap/grammar/ebnf2turtle.py),
[EBNF to BNF Notation-3 rules](http://www.w3.org/2000/10/swap/grammar/ebnf2bnf.n3),
and [First Follow Notation-3 rules](http://www.w3.org/2000/10/swap/grammar/first_follow.n3). 

## Documentation
Full documentation available on [Rubydoc.info][EBNF doc].

## Future Work
* Better LL(1) parser tests
* Either generate [Packrat parser][Packrat] for a [Parsing Regular Expression Grammar][PEG], or integrate with [Treetop][] or similar.

## Author
* [Gregg Kellogg](http://github.com/gkellogg) - <http://greggkellogg.net/>

## Contributing
This repository uses [Git Flow](https://github.com/nvie/gitflow) to mange development and release activity. All submissions _must_ be on a feature branch based on the _develop_ branch to ease staging and integration.

* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `.gemspec`, `VERSION` or `AUTHORS` files. If you need to
  change them, do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the corresponding
  list in the the `README`. Alphabetical order applies.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you.

## License
This is free and unencumbered public domain software. For more information,
see <http://unlicense.org/> or the accompanying {file:UNLICENSE} file.

A copy of the [Turtle EBNF][] and derived parser files are included in the repository, which are not covered under the UNLICENSE. These files are covered via the [W3C Document License](http://www.w3.org/Consortium/Legal/2002/copyright-documents-20021231).

[Ruby]:         http://ruby-lang.org/
[YARD]:         http://yardoc.org/
[YARD-GS]:      http://rubydoc.info/docs/yard/file/docs/GettingStarted.md
[PDD]:          http://lists.w3.org/Archives/Public/public-rdf-ruby/2010May/0013.html
[EBNF]:         http://www.w3.org/TR/REC-xml/#sec-notation
[EBNF doc]:     http://rubydoc.info/github/gkellogg/ebnf/master/frames
[First/Follow]: http://en.wikipedia.org/wiki/LL_parser#Constructing_an_LL.281.29_parsing_table
[LL(1)]:        http://www.csd.uwo.ca/~moreno//CS447/Lectures/Syntax.html/node14.html
[LL(1) Parser]: http://en.wikipedia.org/wiki/LL_parser
[Tokenizer]:    http://en.wikipedia.org/wiki/Lexical_analysis#Tokenizer
[Turtle EBNF]:  http://dvcs.w3.org/hg/rdf/file/default/rdf-turtle/turtle.bnf
[Packrat]:      http://pdos.csail.mit.edu/~baford/packrat/thesis/
[PEG]:          http://en.wikipedia.org/wiki/Parsing_expression_grammar
[Treetop]:      http://rubygems.org/gems/treetop
[Haml]:         http://rubygems.org/gems/haml
