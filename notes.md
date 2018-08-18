---
layout: page
title: Notes
permalink: /notes/
---

<ul id="entry-list" style="list-style: none; margin: 0; padding: 0">
{% for post in site.posts %}
    <li class="entry-list-item">
        <div style="display: flex; flex-flow: column wrap;">
            <a href="{{post.url | relative_url}}">{{post.title}}</a>
            {% if post.alt_title %}
                <a href="{{post.url | relative_url}}" style="font-size: 0.9em">{{post.alt_title}}</a>
            {% endif %}
        </div>
        <span class="post-list-date">{{post.date | date_to_long_string}}</span>
    </li>
{% endfor %}
</ul>