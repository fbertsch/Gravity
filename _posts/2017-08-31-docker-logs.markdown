---
layout: post
title: "Getting logs from a Docker container given it's image"
date: 2017-05-08
published: true 
categories: docker shell
---

This is much easier than cut and paste. Just grep for the image and cut out the logs.

```bash
docker container ps | grep wurstmeister/kafka | cut -f 1 -d " " | xargs docker logs
```
