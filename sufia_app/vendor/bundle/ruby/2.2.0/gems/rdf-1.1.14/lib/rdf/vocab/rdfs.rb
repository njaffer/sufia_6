# -*- encoding: utf-8 -*-
# This file generated automatically using vocab-fetch from http://www.w3.org/2000/01/rdf-schema#
require 'rdf'
module RDF
  class RDFS < RDF::StrictVocabulary("http://www.w3.org/2000/01/rdf-schema#")

    # Class definitions
    term :Class,
      comment: %(The class of classes.).freeze,
      label: "Class".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :Container,
      comment: %(The class of RDF containers.).freeze,
      label: "Container".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :ContainerMembershipProperty,
      comment: %(The class of container membership properties, rdf:_1, rdf:_2, ...,
                    all of which are sub-properties of 'member'.).freeze,
      label: "ContainerMembershipProperty".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subClassOf: "rdf:Property".freeze,
      type: "rdfs:Class".freeze
    term :Datatype,
      comment: %(The class of RDF datatypes.).freeze,
      label: "Datatype".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subClassOf: "rdfs:Class".freeze,
      type: "rdfs:Class".freeze
    term :Literal,
      comment: %(The class of literal values, eg. textual strings and integers.).freeze,
      label: "Literal".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subClassOf: "rdfs:Resource".freeze,
      type: "rdfs:Class".freeze
    term :Resource,
      comment: %(The class resource, everything.).freeze,
      label: "Resource".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdfs:Class".freeze

    # Property definitions
    property :comment,
      comment: %(A description of the subject resource.).freeze,
      domain: "rdfs:Resource".freeze,
      label: "comment".freeze,
      range: "rdfs:Literal".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :domain,
      comment: %(A domain of the subject property.).freeze,
      domain: "rdf:Property".freeze,
      label: "domain".freeze,
      range: "rdfs:Class".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :isDefinedBy,
      comment: %(The defininition of the subject resource.).freeze,
      domain: "rdfs:Resource".freeze,
      label: "isDefinedBy".freeze,
      range: "rdfs:Resource".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      subPropertyOf: "rdfs:seeAlso".freeze,
      type: "rdf:Property".freeze
    property :label,
      comment: %(A human-readable name for the subject.).freeze,
      domain: "rdfs:Resource".freeze,
      label: "label".freeze,
      range: "rdfs:Literal".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :member,
      comment: %(A member of the subject resource.).freeze,
      domain: "rdfs:Resource".freeze,
      label: "member".freeze,
      range: "rdfs:Resource".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :range,
      comment: %(A range of the subject property.).freeze,
      domain: "rdf:Property".freeze,
      label: "range".freeze,
      range: "rdfs:Class".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :seeAlso,
      comment: %(Further information about the subject resource.).freeze,
      domain: "rdfs:Resource".freeze,
      label: "seeAlso".freeze,
      range: "rdfs:Resource".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :subClassOf,
      comment: %(The subject is a subclass of a class.).freeze,
      domain: "rdfs:Class".freeze,
      label: "subClassOf".freeze,
      range: "rdfs:Class".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze
    property :subPropertyOf,
      comment: %(The subject is a subproperty of a property.).freeze,
      domain: "rdf:Property".freeze,
      label: "subPropertyOf".freeze,
      range: "rdf:Property".freeze,
      "rdfs:isDefinedBy" => %(rdfs:).freeze,
      type: "rdf:Property".freeze

    # Extra definitions
    term :"",
      "dc11:title" => %(The RDF Schema vocabulary \(RDFS\)).freeze,
      label: "".freeze,
      "rdfs:seeAlso" => %(http://www.w3.org/2000/01/rdf-schema-more).freeze,
      type: "owl:Ontology".freeze
  end
end
