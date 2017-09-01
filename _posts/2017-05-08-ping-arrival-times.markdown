---
layout: post
title: "Charting Data Arrival for Firefox Nightly"
date: 2017-05-08
published: true 
categories: mozilla telemetry nightly firefox
---

As the owner of the [aggregates job](http://github.com/mozilla/python_mozaggregator) I often get pulled into questions of "something looks very wrong with the data!" These run the gamit from "interesting" to "extremely suspicious". Back in the fall we ran into a [rather interesting one](https://bugzilla.mozilla.org/show_bug.cgi?id=1315981) - the recent nightly builds seemed to have a low count of pings. The plot below illustrates this.

![boy, hardly any patterns here!]({{ site.url }}/imgs/nightly_build_uptake_evo.png "Evolution Plot from TMO")

[Click here to see the above image in action](https://mzl.la/2ppbzBu). Note the numbers may change as this post ages.

I took this screenshot on 2017-05-08. The x-axis is build ID (a date), and the y-axis is number of submissions. It's pretty clear that the last few days are trending down. The question is, do we raise the alarm? Has something gone wrong? 

To answer that question, I made a CDF of days between build ID and submission date. That is, a given ping is from a certain build (e.g. 20170501), and it was submitted on a certain day (e.g. 2017-05-02). In that example, there is one day between the build date and submission date. We want to determine when to get nervous - how many days after a build do we decide that we haven't recieved enough pings? This is related to the ever-present question of channel uptake (how long until users update to a new build), but we're answering an easier query here.

![that sure is a long tail]({{ site.url }}/imgs/build_date_data_lag.png "Build Data Data Lag")

You can read this by following the blue line, where the x-axis is number of days since the build, and the y-axis is fraction of pings we have recieved.  Usually we recieve 1/3 of pings within 2 days, and 1/2 of pings within 28 days. This lets us rest a little - a given build's submission count is going to increase for over a month. A few days is not nearly enough to raise the alarm based on raw numbers themselves.

Do all builds follow this pattern? I plotted all of the builds from July 2016 (where we presumably have recieved all of the pings), to see how long it took us to recieve the data from each of those.

![Notice the one terrible build]({{ site.url }}/imgs/build_date_data_lag_per_build.png "Per build data lag")

It is clear that different builds follow different patterns. The build from 2016-06-05 (at the top-left) recieved more than 90% of it's pings in 1 day. Another, from 2016-06-29, took more than 120 days to reach that same point (hard to miss - it's all the way on the bottom). The next questions would be "why" - what causes different builds to move their CDFs left or right? I'll leave that for another post.
