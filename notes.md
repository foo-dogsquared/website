---
layout: page
title: Notes
permalink: /notes/
---

<ul id="entry-list" style="list-style: none; margin: 0; padding: 0">
{% for post in site.posts %}
    <li class="entry-list-item">
        <a href="{{post.url | relative_url}}">{{post.title}}</a>
        <span class="post-list-date">{{post.date | date_to_long_string}}</span>
    </li>
{% endfor %}
</ul>