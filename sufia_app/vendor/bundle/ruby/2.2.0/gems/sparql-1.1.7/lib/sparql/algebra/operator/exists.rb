module SPARQL; module Algebra
  class Operator
    ##
    # The SPARQL logical `exists` operator.
    #
    # @example
    #    (prefix ((ex: <http://www.example.org/>))
    #      (filter (exists (bgp (triple ?s ?p ex:o)))
    #      (bgp (triple ?s ?p ?o))))
    #
    # @see http://www.w3.org/TR/sparql11-query/#func-abs
    # @see http://www.w3.org/TR/xpath-functions/#func-abs
    class Exists < Operator::Unary
      include Evaluatable

      NAME = [:exists]

      ##
      # Exvaluating this operator executes the query in the first operator passing in each existing bindings.
      #
      # @param  [RDF::Query::Solution] bindings
      #   a query solution containing zero or more variable bindings
      # @param [Hash{Symbol => Object}] options ({})
      #   options passed from query
      # @option options[RDF::Queryable] queryable
      #   queryable to execute, using bindings as an initial solution.
      # @return [RDF::Literal::Boolean] `true` or `false`
      def evaluate(bindings, options = {})
        queryable = options[:queryable]
        !operand(0).execute(queryable, options.merge(
                                        solutions: RDF::Query::Solutions(bindings),
                                        depth: options[:depth].to_i + 1)).empty?
      end
    end # Exists
  end # Operator
end; end # SPARQL::Algebra
