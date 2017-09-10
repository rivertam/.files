#!/usr/local/bin/node

const birthday = new Date(1993, 4, 20);
const today = new Date();

const msDiff = today.getTime() - birthday.getTime();
const dayDiff = Math.round(100 * msDiff / (1000 * 60 * 60 * 24)) / 100;

console.log(dayDiff);
