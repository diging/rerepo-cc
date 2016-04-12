# Generated via
#  `rails generate curation_concerns:work Resource`
class Resource < ActiveFedora::Base
  include ::CurationConcerns::WorkBehavior
  include ::CurationConcerns::BasicMetadata
  validates :title, presence: { message: 'Your work must have a title.' }


  has_and_belongs_to_many :title_principals, :predicate => MODS::MODSRDFVocabulary.titlePrincipal, :class_name => "MODS::MADS::Title"
  accepts_nested_attributes_for :title_principals, :allow_destroy => true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :title_uniforms, :predicate => MODS::MODSRDFVocabulary.titleUniform, :class_name => "MODS::MADS::Title"
  accepts_nested_attributes_for :title_uniforms, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  property :abstract, predicate: MODS::MODSRDFVocabulary.abstract, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :access_condition, predicate: MODS::MODSRDFVocabulary.accessCondition, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  has_and_belongs_to_many :genres, :predicate => MODS::MODSRDFVocabulary.genre, :class_name => "MODS::Genre"
  accepts_nested_attributes_for :genres, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  property :language_of_resources, predicate: MODS::MODSRDFVocabulary.languageOfResource, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  has_and_belongs_to_many :location_of_resources, :predicate => MODS::MODSRDFVocabulary.locationOfResource, :class_name => "MODS::Location"
  accepts_nested_attributes_for :location_of_resources, allow_destroy: true, :reject_if => proc { |attributes| attributes['location_physical'].blank? and attributes['location_shelf_locator'].blank? and attributes['url'].blank? }

  #has_and_belongs_to_many :name_principals, :predicate => MODS::MODSRDFVocabulary.namePrincipal, :class_name => "MODS::MADS::Name"
  #accepts_nested_attributes_for :name_principals, allow_destroy: true

  has_and_belongs_to_many :names, :predicate => MODS::MODSRDFVocabulary.name, :class_name => "MODS::MADS::Name"
  accepts_nested_attributes_for :names, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  property :notes, predicate: MODS::MODSRDFVocabulary.note, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  # note of type "statement of responsibilit"
  property :statement_of_responsibility, predicate: MODS::MODSRDFVocabulary.statementOfResponsibility, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  has_and_belongs_to_many :note_groups, :predicate => MODS::MODSRDFVocabulary.noteGroup, :class_name => "MODS::NoteGroup"
  accepts_nested_attributes_for :note_groups, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? and attributes['note_group_note'].blank? }

  # from MODS RDF:
  # In MODS XML originInfo binds together information pertaining to origination of the resource.
  # The binding is considered necessary because originInfo may repeat, for different origination events.
  # However, in this ontology, different instances of originInfo are considered to be different resource.
  # MODS RDF dispenses with the container and instead, each originInfo subelement tranforms to a direct property of the resource.
  property :edition, predicate: MODS::MODSRDFVocabulary.edition, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :frequency, predicate: MODS::MODSRDFVocabulary.frequency, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :date_issued, predicate: MODS::MODSRDFVocabulary.dateIssued, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  has_and_belongs_to_many :parts, :predicate => MODS::MODSRDFVocabulary.part, :class_name => "MODS::Part"
  accepts_nested_attributes_for :parts, allow_destroy: true, :reject_if => proc { |attributes| attributes['part_order'].blank? and attributes['part_level'].blank? and attributes['part_caption'].blank? and attributes['part_number'].blank? }

  # from MODS RDF:
  # n MODS XML it binds together information pertaining to physical characteristics of the resource.
  # MODS RDF dispenses with the container and instead, each physical description subelement tranforms to a direct property of the resource.
  property :form, predicate: MODS::MODSRDFVocabulary.form, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :reformatting_quality, predicate: MODS::MODSRDFVocabulary.reformattingQuality, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :media_type, predicate: MODS::MODSRDFVocabulary.mediaType, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :extent, predicate: MODS::MODSRDFVocabulary.extent, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  property :digital_origin, predicate: MODS::MODSRDFVocabulary.digitalOrigin, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  has_and_belongs_to_many :related_hosts, :predicate => MODS::MODSRDFVocabulary.relatedHost, :class_name => "Resource"
  accepts_nested_attributes_for :related_hosts

  has_and_belongs_to_many :related_referenced_by, :predicate => MODS::MODSRDFVocabulary.relatedReferencedBy, :class_name => "Resource"
  accepts_nested_attributes_for :related_referenced_by

  has_and_belongs_to_many :related_originals, :predicate => MODS::MODSRDFVocabulary.relatedOriginal, :class_name => "Resource"
  accepts_nested_attributes_for :related_originals

  has_and_belongs_to_many :related_formats, :predicate => MODS::MODSRDFVocabulary.relatedFormat, :class_name => "Resource"
  accepts_nested_attributes_for :related_formats

  has_and_belongs_to_many :related_versions, :predicate => MODS::MODSRDFVocabulary.relatedVersion, :class_name => "Resource"
  accepts_nested_attributes_for :related_versions

  has_and_belongs_to_many :related_precedings, :predicate => MODS::MODSRDFVocabulary.relatedPreceding, :class_name => "Resource"
  accepts_nested_attributes_for :related_precedings

  has_and_belongs_to_many :related_references, :predicate => MODS::MODSRDFVocabulary.relatedReference, :class_name => "Resource"
  accepts_nested_attributes_for :related_references

  has_and_belongs_to_many :related_reviews, :predicate => MODS::MODSRDFVocabulary.relatedReview, :class_name => "Resource"
  accepts_nested_attributes_for :related_reviews

  has_and_belongs_to_many :related_series, :predicate => MODS::MODSRDFVocabulary.relatedSeries, :class_name => "Resource"
  accepts_nested_attributes_for :related_series

  has_and_belongs_to_many :related_succeedings, :predicate => MODS::MODSRDFVocabulary.relatedSucceeding, :class_name => "Resource"
  accepts_nested_attributes_for :related_succeedings

  # subject fields
  has_and_belongs_to_many :subject_topics, :predicate => MODS::MODSRDFVocabulary.subjectTopic, :class_name => "MODS::MADS::Topic"
  accepts_nested_attributes_for :subject_topics, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_geographics, :predicate => MODS::MODSRDFVocabulary.subjectGeographic, :class_name => "MODS::MADS::Geographic"
  accepts_nested_attributes_for :subject_geographics, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_temporals, :predicate => MODS::MODSRDFVocabulary.subjectTemporal, :class_name => "MODS::MADS::Temporal"
  accepts_nested_attributes_for :subject_temporals, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_titles, :predicate => MODS::MODSRDFVocabulary.subjectTitle, :class_name => "MODS::MADS::Title"
  accepts_nested_attributes_for :subject_titles, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_geographic_codes, :predicate => MODS::MODSRDFVocabulary.subjectGeographicCode, :class_name => "MODS::MADS::GeographicCode"
  accepts_nested_attributes_for :subject_geographic_codes, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_hierarchical_geographics, :predicate => MODS::MODSRDFVocabulary.subjectHierarchicalGeographic, :class_name => "MODS::MADS::HierarchicalGeographic"
  accepts_nested_attributes_for :subject_hierarchical_geographics, allow_destroy: true,
                                :reject_if => proc { |attributes| attributes['continent'].blank? and attributes['country'].blank? and attributes['province'].blank? and attributes['region'].blank? and attributes['state'].blank? and attributes['territory'].blank? and attributes['county'].blank? and attributes['city'].blank? and attributes['citySection'].blank? and attributes['island'].blank? and attributes['area'].blank? and attributes['extraterrestrial_area'].blank?}

  has_and_belongs_to_many :cartographics, :predicate => MODS::MODSRDFVocabulary.cartographics, :class_name => "MODS::MADS::Cartographics"
  accepts_nested_attributes_for :cartographics, allow_destroy: true, :reject_if => proc { |attributes| attributes['scale'].blank? and attributes['projection'].blank? and attributes['coordinates'].blank? }

  has_and_belongs_to_many :subject_occupations, :predicate => MODS::MODSRDFVocabulary.subjectOccupation, :class_name => "MODS::MADS::Occupation"
  accepts_nested_attributes_for :subject_occupations, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  has_and_belongs_to_many :subject_genres, :predicate => MODS::MODSRDFVocabulary.subjectGenre, :class_name => "MODS::MADS::GenreForm"
  accepts_nested_attributes_for :subject_genres, allow_destroy: true, :reject_if => proc { |attributes| attributes['label'].blank? }

  # table of contents
  property :table_of_contents, predicate: MODS::MODSRDFVocabulary.tableOfContents, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

  # target audience
  property :target_audience, predicate: MODS::MODSRDFVocabulary.targetAudience, multiple: true do |index|
    index.as :stored_searchable, :facetable
  end

end
