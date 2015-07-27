# -*- encoding: utf-8 -*-
# This file generated automatically using vocab-fetch from http://id.loc.gov/vocabulary/preservation/eventType.nt
require 'rdf'
module RDF::Vocab
  class PremisEventType < RDF::StrictVocabulary("http://id.loc.gov/vocabulary/preservation/eventType/")

    # Extra definitions
    term :cap,
      label: "capture".freeze,
      "mads:authoritativeLabel" => %(capture).freeze,
      "mads:code" => %(cap).freeze,
      "skos:notation" => %(cap).freeze,
      "skos:prefLabel" => %(capture).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :collection_PREMIS,
      label: "PREMIS Event Types Collection".freeze,
      type: "mads:MADSCollection".freeze
    term :com,
      label: "compression".freeze,
      "mads:authoritativeLabel" => %(compression).freeze,
      "mads:code" => %(com).freeze,
      "skos:notation" => %(com).freeze,
      "skos:prefLabel" => %(compression).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :cre,
      label: "creation".freeze,
      "mads:authoritativeLabel" => %(creation).freeze,
      "mads:code" => %(cre).freeze,
      "skos:notation" => %(cre).freeze,
      "skos:prefLabel" => %(creation).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :dea,
      label: "deaccession".freeze,
      "mads:authoritativeLabel" => %(deaccession).freeze,
      "mads:code" => %(dea).freeze,
      "skos:notation" => %(dea).freeze,
      "skos:prefLabel" => %(deaccession).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :dec,
      label: "decompression".freeze,
      "mads:authoritativeLabel" => %(decompression).freeze,
      "mads:code" => %(dec).freeze,
      "skos:notation" => %(dec).freeze,
      "skos:prefLabel" => %(decompression).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :del,
      label: "deletion".freeze,
      "mads:authoritativeLabel" => %(deletion).freeze,
      "mads:code" => %(del).freeze,
      "skos:notation" => %(del).freeze,
      "skos:prefLabel" => %(deletion).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :der,
      label: "decryption".freeze,
      "mads:authoritativeLabel" => %(decryption).freeze,
      "mads:code" => %(der).freeze,
      "skos:notation" => %(der).freeze,
      "skos:prefLabel" => %(decryption).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :dig,
      label: "digital signature validation".freeze,
      "mads:authoritativeLabel" => %(digital signature validation).freeze,
      "mads:code" => %(dig).freeze,
      "skos:notation" => %(dig).freeze,
      "skos:prefLabel" => %(digital signature validation).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :fix,
      label: "fixity check".freeze,
      "mads:authoritativeLabel" => %(fixity check).freeze,
      "mads:code" => %(fix).freeze,
      "skos:notation" => %(fix).freeze,
      "skos:prefLabel" => %(fixity check).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :ing,
      label: "ingestion".freeze,
      "mads:authoritativeLabel" => %(ingestion).freeze,
      "mads:code" => %(ing).freeze,
      "skos:notation" => %(ing).freeze,
      "skos:prefLabel" => %(ingestion).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :mes,
      label: "message digest calculation".freeze,
      "mads:authoritativeLabel" => %(message digest calculation).freeze,
      "mads:code" => %(mes).freeze,
      "skos:notation" => %(mes).freeze,
      "skos:prefLabel" => %(message digest calculation).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :mig,
      label: "migration".freeze,
      "mads:authoritativeLabel" => %(migration).freeze,
      "mads:code" => %(mig).freeze,
      "skos:notation" => %(mig).freeze,
      "skos:prefLabel" => %(migration).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :nor,
      label: "normalization".freeze,
      "mads:authoritativeLabel" => %(normalization).freeze,
      "mads:code" => %(nor).freeze,
      "skos:notation" => %(nor).freeze,
      "skos:prefLabel" => %(normalization).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :rep,
      label: "replication".freeze,
      "mads:authoritativeLabel" => %(replication).freeze,
      "mads:code" => %(rep).freeze,
      "skos:notation" => %(rep).freeze,
      "skos:prefLabel" => %(replication).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :val,
      label: "validation".freeze,
      "mads:authoritativeLabel" => %(validation).freeze,
      "mads:code" => %(val).freeze,
      "skos:notation" => %(val).freeze,
      "skos:prefLabel" => %(validation).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
    term :vir,
      label: "virus check".freeze,
      "mads:authoritativeLabel" => %(virus check).freeze,
      "mads:code" => %(vir).freeze,
      "skos:notation" => %(vir).freeze,
      "skos:prefLabel" => %(virus check).freeze,
      type: ["mads:Topic".freeze, "mads:Authority".freeze, "skos:Concept".freeze]
  end
end
