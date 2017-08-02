$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'prosperworks'

require "minitest/autorun"
require 'minitest/unit'
require 'minitest/pride'
require 'webmock/minitest'

module Helpers

  def headers
    {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'application/json',
      'User-Agent'=>'Ruby',
      'X-Pw-Application'=>'developer_api'
    }
  end

  # TODO: should instead call ProsperWorks::ApiOperations::Connect.get_uri
  # but I can't figure out how to do that
  def get_uri(api_name, id = nil)
    base_url = "https://api.prosperworks.com/developer_api/v1/"
    url = base_url + "#{api_name}"
    url = url + "/#{id}" unless id.nil?
    URI.parse(url)
  end

  #
  # =============
  # test data
  # =============
  #

  #
  # ID Space
  #
  # 100s: users
  # 200s: people
  # 300s: leads
  # 400s: opportunity
  # 500s: companies
  # 600s: tasks
  # 700s: projects
  # 800s: webhooks
  #
  # 1000s: custom field definitions
  # 1100s: contact types
  # 1200s: custom sources
  # 1300s: lead statuses
  #
  # 1500s: pipelines
  # 1600s: stages
  #

  def company_payload
    JSON.generate(company_details)
  end

  def company_details
    {
      id: 500,
      name: "Sample Company",
      address: {
        street: "100 Lower West Street",
        city: "Halifax",
        state: "Ns",
        postal_code: "B3J 3Z3",
        country: "CA"
      },
      assignee_id: 102,
      contact_type_id: 1102,
      details: "details",
      email_domain: "manageyourspend.com",
      phone_numbers: [],
      socials: [
        {
          url: "http://klout.com/sample-company",
          category: "klout"
        },
      ],
      tags: [],
      websites: [
        {
          url: "http://sample-company.com",
          category: "work"
        }
      ],
      custom_fields: [
        { custom_field_definition_id: 1_000, value: 34 },
        { custom_field_definition_id: 1_002, value: "finance" },
      ],
      interaction_count: 4,
      date_created: 1487636069,
      date_modified: 1489020631
    }
  end

  def lead_payload
    JSON.generate(lead_details)
  end

  def lead_details
    {
      id: 300,
      name: "A Qualified Lead",
      prefix: nil,
      first_name: "A",
      last_name: "Lead",
      middle_name: "Qualified",
      suffix: nil,
      address: {
        street: "500 A Street",
        city: "New York",
        state: "NY",
        postal_code: "12345",
        country: "USA"
      },
      assignee_id: 101,
      company_name: "Pied Piper",
      customer_source_id: 1_200,
      details: "some details about the lead",
      email: { email: "test@test.test", category: "work" },
      interaction_count: 5,
      monetary_value: 3_000,
      socials: [
        {
          url: "http://some_social_media_site.com",
          category: "other"
        },
      ],
      status: "New",
      status_id: 1_300,
      tags: ["a", "b", "c"],
      title: "Chief Purchaser",
      websites: [],
      phone_numbers: [],
      custom_fields: [
        { custom_field_definition_id: 1_000, value: 40 },
        { custom_field_definition_id: 1_001, value: "construction" },
      ],
      date_created: 1487288498,
      date_modified: 1487293284,
      date_last_contacted: 1487293200
    }
  end

  def opportunity_payload
    JSON.generate(opportunity_details)
  end

  def opportunity_details
    {
      id: 400,
      name: "Do This Now",
      assignee_id: 100,
      close_date: "9/26/2017",
      company_id: 600,
      company_name: "XYZ",
      customer_source_id: 1_201,
      details: "how to win this deal!",
      loss_reason_id: 1_700,
      pipeline_id: 1_500,
      pipeline_stage_id: 1_600,
      primary_contact_id: 201,
      priority: "Low",
      status: "Open",
      tags: ["one", "two", "three"],
      interaction_count: 10,
      monetary_value: 5_000,
      win_probability: 60,
      date_created: 1481240826,
      date_modified: 1499476394,
      custom_fields: [
        { custom_field_definition_id: 1_000, value: 63 },
        { custom_field_definition_id: 1_001, value: "customer service"},
      ]
    }
  end

  def person_payload
    JSON.generate(person_details)
  end

  def person_details
    {
      id: 200,
      name: "John K Doe",
      prefix: nil,
      first_name: "John",
      middle_name: "K",
      last_name: "Doe",
      suffix: nil,
      address: {
        street: "100 Main Street",
        city: "Somewhere",
        state: "CA",
        postal_code: "90000",
        country: "USA"
      },
      assignee_id: 100,
      company_id: 300,
      company_name: "ProsperWorks Inc.",
      contact_type_id: 1_100,
      details: "some details",
      emails: [{"email":"test@test.test","category":"work"}],
      phone_numbers: [],
      socials: [],
      tags: [],
      title: nil,
      websites: [],
      custom_fields: [
        {custom_field_definition_id: 1_000, value: 34},
        {custom_field_definition_id: 1_001, value: "ecommerce"},
        {custom_field_definition_id: 1_002, value: 10_000},
      ],
      date_created: 1499451215,
      date_modified: 1499732956,
      date_last_contacted: nil,
      interaction_count: 0
    }
  end

  def project_payload
    JSON.generate(project_details)
  end

  def project_details
    {
      id: 700,
      name: "Test Project",
      related_resource: {
        id: 400,
        type: "opportunity"
      },
      assignee_id: 103,
      status: "Open",
      details: "more details to complete",
      tags: ["one", "two", "three"],
      custom_fields: [
        { custom_field_definition_id: 1_000, value: 234 },
        { custom_field_definition_id: 1_001, value: "healthcare" },
      ],
      date_created: 1493158054,
      date_modified: 1493158055
    }
  end

  def task_payload
    JSON.generate(task_details)
  end

  def task_details
    {
      id: 601,
      name: "drink coffee",
      related_resource: {
        id: 402,
        type: "opportunity"
      },
      assignee_id: 104,
      due_date: 13578888600,
      reminder_date: 1496168331,
      completed_date: nil,
      priority: "High",
      status: "Open",
      details: "please do this task",
      tags: ["a", "b", "c"],
      custom_fields: [
        { custom_field_definition_id: 1_000, value: 234 },
        { custom_field_definition_id: 1_001, value: "internet technology" },
      ],
      date_created: 1492475154,
      date_modified: 1496168333
    }
  end

  def webhook_payload
    JSON.generate(webhook_details)
  end

  def webhook_details
    {
      id: 800,
      target: "https://myserver.net",
      event: "new",
      type: "lead",
      secret: { key_a: "value_a" }
    }
  end

end