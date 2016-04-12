# Generated via
#  `rails generate curation_concerns:work Resource`

class CurationConcerns::ResourcesController < ApplicationController
  include CurationConcerns::CurationConcernController
  self.curation_concern_type = Resource
end
