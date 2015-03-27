{%- from "tvheadend/map.jinja" import server with context %}
{%- if server.enabled %}

tvheadend_repo:
  pkgrepo.managed:
  - human_name: TVheadend
  - name: deb http://apt.tvheadend.org/unstable {{ grains['oscodename'] }} main
  - file: /etc/apt/sources.list.d/tvheadend.list
  - key_url: salt://tvheadend/files/tvheadend.gpg
  - require_in:
    - pkg: tvheadend_packages


tvheadend_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

{%- for user_name, user in server.user.iteritems() %}

/home/{{ user_name }}/.hts:
  file.directory:
  - user: {{ user_name }}
  - group: {{ user_name }}
  - mode: 755
  - makedirs: True

tvheadend_config:
  file.managed:
  - name: /home/{{ user_name }}/.hts/tvheadend
  - template: jinja
  - source: {{ server.config_template }}
  - mode: 644

{%- endfor %}

{%- endif %}