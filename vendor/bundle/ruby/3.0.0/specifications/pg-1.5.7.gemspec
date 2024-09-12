# -*- encoding: utf-8 -*-
# stub: pg 1.5.7 ruby lib
# stub: ext/extconf.rb

Gem::Specification.new do |s|
  s.name = "pg".freeze
  s.version = "1.5.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/ged/ruby-pg/blob/master/History.md", "documentation_uri" => "http://deveiate.org/code/pg", "homepage_uri" => "https://github.com/ged/ruby-pg", "source_code_uri" => "https://github.com/ged/ruby-pg" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze, "Lars Kanis".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEBDCCAmygAwIBAgIBAzANBgkqhkiG9w0BAQsFADAoMSYwJAYDVQQDDB1sYXJz\nL0RDPWdyZWl6LXJlaW5zZG9yZi9EQz1kZTAeFw0yNDAyMjgxOTMxNDdaFw0yNTAy\nMjcxOTMxNDdaMCgxJjAkBgNVBAMMHWxhcnMvREM9Z3JlaXotcmVpbnNkb3JmL0RD\nPWRlMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAwum6Y1KznfpzXOT/\nmZgJTBbxZuuZF49Fq3K0WA67YBzNlDv95qzSp7V/7Ek3NCcnT7G+2kSuhNo1FhdN\neSDO/moYebZNAcu3iqLsuzuULXPLuoU0GsMnVMqV9DZPh7cQHE5EBZ7hlzDBK7k/\n8nBMvR0mHo77kIkapHc26UzVq/G0nKLfDsIHXVylto3PjzOumjG6GhmFN4r3cP6e\nSDfl1FSeRYVpt4kmQULz/zdSaOH3AjAq7PM2Z91iGwQvoUXMANH2v89OWjQO/NHe\nJMNDFsmHK/6Ji4Kk48Z3TyscHQnipAID5GhS1oD21/WePdj7GhmbF5gBzkV5uepd\neJQPgWGwrQW/Z2oPjRuJrRofzWfrMWqbOahj9uth6WSxhNexUtbjk6P8emmXOJi5\nchQPnWX+N3Gj+jjYxqTFdwT7Mj3pv1VHa+aNUbqSPpvJeDyxRIuo9hvzDaBHb/Cg\n9qRVcm8a96n4t7y2lrX1oookY6bkBaxWOMtWlqIprq8JZXM9AgMBAAGjOTA3MAkG\nA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBQ4h1tIyvdUWtMI739xMzTR\n7EfMFzANBgkqhkiG9w0BAQsFAAOCAYEArBmHSfnUyNWf3R1Fx0mMHloWGdcKn2D2\nBsqTApXU2nADiyppIqRq4b9e7hw342uzadSLkoQcEFOxThLRhAcijoWfQVBcsbV/\nZsCY1qlUTIJuSWxaSyS4efUX+N4eMNyPM9oW/sphlWFo0DgI34Y9WB6HDzH+O71y\nR7PARke3f4kYnRJf5yRQLPDrH9UYt9KlBQm6l7XMtr5EMnQt0EfcmZEi9H4t/vS2\nhaxvpFMdAKo4H46GBYNO96r6b74t++vgQSBTg/AFVwvRZwNSrPPcBfb4xxeEAhRR\nx+LU7feIH7lZ//3buiyD03gLAEtHXai0Y+/VfuWIpwYJAl2BO/tU7FS/dtbJq9oc\ndI36Yyzy+BrCM0WT4oCsagePNb97FaNhl4F6sM5JEPT0ZPxRx0i3G4TNNIYziVos\n5wFER6XhvvLDFAMh/jMg+s7Wd5SbSHgHNSUaUGVtdWkVPOer6oF0aLdZUR3CETkn\n5nWXZma/BUd3YgYA/Xumc6QQqIS4p7mr\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2024-07-28"
  s.description = "Pg is the Ruby interface to the PostgreSQL RDBMS. It works with PostgreSQL 9.3 and later.".freeze
  s.email = ["ged@FaerieMUD.org".freeze, "lars@greiz-reinsdorf.de".freeze]
  s.extensions = ["ext/extconf.rb".freeze]
  s.extra_rdoc_files = ["Contributors.rdoc".freeze, "History.md".freeze, "README-OS_X.rdoc".freeze, "README-Windows.rdoc".freeze, "README.ja.md".freeze, "README.md".freeze, "ext/gvl_wrappers.c".freeze, "ext/gvl_wrappers.h".freeze, "ext/pg.c".freeze, "ext/pg.h".freeze, "ext/pg_binary_decoder.c".freeze, "ext/pg_binary_encoder.c".freeze, "ext/pg_coder.c".freeze, "ext/pg_connection.c".freeze, "ext/pg_copy_coder.c".freeze, "ext/pg_errors.c".freeze, "ext/pg_record_coder.c".freeze, "ext/pg_result.c".freeze, "ext/pg_text_decoder.c".freeze, "ext/pg_text_encoder.c".freeze, "ext/pg_tuple.c".freeze, "ext/pg_type_map.c".freeze, "ext/pg_type_map_all_strings.c".freeze, "ext/pg_type_map_by_class.c".freeze, "ext/pg_type_map_by_column.c".freeze, "ext/pg_type_map_by_mri_type.c".freeze, "ext/pg_type_map_by_oid.c".freeze, "ext/pg_type_map_in_ruby.c".freeze, "ext/pg_util.c".freeze, "ext/pg_util.h".freeze, "lib/pg.rb".freeze, "lib/pg/basic_type_map_based_on_result.rb".freeze, "lib/pg/basic_type_map_for_queries.rb".freeze, "lib/pg/basic_type_map_for_results.rb".freeze, "lib/pg/basic_type_registry.rb".freeze, "lib/pg/binary_decoder/date.rb".freeze, "lib/pg/binary_decoder/timestamp.rb".freeze, "lib/pg/binary_encoder/timestamp.rb".freeze, "lib/pg/coder.rb".freeze, "lib/pg/connection.rb".freeze, "lib/pg/exceptions.rb".freeze, "lib/pg/result.rb".freeze, "lib/pg/text_decoder/date.rb".freeze, "lib/pg/text_decoder/inet.rb".freeze, "lib/pg/text_decoder/json.rb".freeze, "lib/pg/text_decoder/numeric.rb".freeze, "lib/pg/text_decoder/timestamp.rb".freeze, "lib/pg/text_encoder/date.rb".freeze, "lib/pg/text_encoder/inet.rb".freeze, "lib/pg/text_encoder/json.rb".freeze, "lib/pg/text_encoder/numeric.rb".freeze, "lib/pg/text_encoder/timestamp.rb".freeze, "lib/pg/tuple.rb".freeze, "lib/pg/type_map_by_column.rb".freeze, "lib/pg/version.rb".freeze]
  s.files = ["Contributors.rdoc".freeze, "History.md".freeze, "README-OS_X.rdoc".freeze, "README-Windows.rdoc".freeze, "README.ja.md".freeze, "README.md".freeze, "ext/extconf.rb".freeze, "ext/gvl_wrappers.c".freeze, "ext/gvl_wrappers.h".freeze, "ext/pg.c".freeze, "ext/pg.h".freeze, "ext/pg_binary_decoder.c".freeze, "ext/pg_binary_encoder.c".freeze, "ext/pg_coder.c".freeze, "ext/pg_connection.c".freeze, "ext/pg_copy_coder.c".freeze, "ext/pg_errors.c".freeze, "ext/pg_record_coder.c".freeze, "ext/pg_result.c".freeze, "ext/pg_text_decoder.c".freeze, "ext/pg_text_encoder.c".freeze, "ext/pg_tuple.c".freeze, "ext/pg_type_map.c".freeze, "ext/pg_type_map_all_strings.c".freeze, "ext/pg_type_map_by_class.c".freeze, "ext/pg_type_map_by_column.c".freeze, "ext/pg_type_map_by_mri_type.c".freeze, "ext/pg_type_map_by_oid.c".freeze, "ext/pg_type_map_in_ruby.c".freeze, "ext/pg_util.c".freeze, "ext/pg_util.h".freeze, "lib/pg.rb".freeze, "lib/pg/basic_type_map_based_on_result.rb".freeze, "lib/pg/basic_type_map_for_queries.rb".freeze, "lib/pg/basic_type_map_for_results.rb".freeze, "lib/pg/basic_type_registry.rb".freeze, "lib/pg/binary_decoder/date.rb".freeze, "lib/pg/binary_decoder/timestamp.rb".freeze, "lib/pg/binary_encoder/timestamp.rb".freeze, "lib/pg/coder.rb".freeze, "lib/pg/connection.rb".freeze, "lib/pg/exceptions.rb".freeze, "lib/pg/result.rb".freeze, "lib/pg/text_decoder/date.rb".freeze, "lib/pg/text_decoder/inet.rb".freeze, "lib/pg/text_decoder/json.rb".freeze, "lib/pg/text_decoder/numeric.rb".freeze, "lib/pg/text_decoder/timestamp.rb".freeze, "lib/pg/text_encoder/date.rb".freeze, "lib/pg/text_encoder/inet.rb".freeze, "lib/pg/text_encoder/json.rb".freeze, "lib/pg/text_encoder/numeric.rb".freeze, "lib/pg/text_encoder/timestamp.rb".freeze, "lib/pg/tuple.rb".freeze, "lib/pg/type_map_by_column.rb".freeze, "lib/pg/version.rb".freeze]
  s.homepage = "https://github.com/ged/ruby-pg".freeze
  s.licenses = ["BSD-2-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--title".freeze, "PG: The Ruby PostgreSQL Driver".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Pg is the Ruby interface to the PostgreSQL RDBMS".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version
end
