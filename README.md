# textile_to_html

Tiny Redmine plugin that will convert all textile notes into html inside the database.

## Purpose

The impetus for this plugin was to convert the notes for use with the redmine_ckeditor.

This saves and loads notes as HTML so installing it on an in use Redmine system makes the textile based notes already there load funny.

By using this plugin you can convert all the old textile based notes to html to work with the editor.

## Installation

Just clone or copy the repo into the plugins directory of Redmine. This will expose a `convert:to_html` rake task that will go through and update the database.

**Use caution running this plugin as it will update the database!!!**

## Usage

Because this plugin can update the database you must specify an extra env var if you want it to actually run. The following code will run the task against the database version just print it out to the screen:

    rake convert:to_html for_reals=true
