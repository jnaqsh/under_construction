under_construction
==================

A gem for under construction page in rails

Install
=======

In rails 3 you have to add this gem in th GemFile

     gem 'under_construction'

Config
======

Put your config in config/under_construction.yml file:

    development:
      site:
        name: "SITE NAME"
        logo_url: "LOGO URL"
      site_developer:
        name: "SITE DEVELOPER NAME"
        logo_url: "SITE DEVELOPER LOGO"
      completed_at: "DATE OF COMPELETION"
      progress: "percent"
      progress_label: "progress status"
      social:
        twitter: "TWITTER ACCOUNT"
        facebook: "FACEBOOK ACCOUNT"

LICENSE
=======
This project is a gem for under construction page in rails.
    Copyright (C) 2012  Naqsh Jahan Toos Inc.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
