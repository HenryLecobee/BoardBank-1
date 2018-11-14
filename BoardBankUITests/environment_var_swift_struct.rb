#!/usr/bin/ruby

file_content = <<-ENVIRONMENT_VAR_FILE

struct EnvironmentVariables {

    static let ecobeeUsername = "#{ENV['ECOBEE_USERNAME']}"
    static let ecobeePassword = "#{ENV['ECOBEE_PASSWORD']}"

}
ENVIRONMENT_VAR_FILE

file = File.new("#{ENV['SRCROOT'] || ENV['FASTLANE_WORK_DIR']}/BoardBankUITests/Helpers/EnvironmentVariables.swift", "w")
file.puts(file_content)
file.close
