FROM bash:latest
FROM ruby:latest
FROM python:3.10.8-bullseye
FROM gcc:latest
FROM golang:latest
FROM dart:latest
FROM crystallang/crystal:latest
FROM node:latest
FROM julia:latest
FROM clojure:latest
FROM mcr.microsoft.com/powershell
FROM swift:latest
FROM nimlang/nim:latest
FROM rust:latest

ARG LANGUAGE
ARG PLATFORM
ARG TOKEN
ENV TOKEN=$TOKEN

RUN if [ "$LANGUAGE" = "node"] && [  "$PLATFORM" = "discord"] then \
    node discord/javascript/bot.js \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    node stdout/javascript/main.js \
    if [ "$LANGUAGE" = "python"] && [  "$PLATFORM" = "discord"] then \
    python discord/python/bot.py \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    python stdout/python/main.py \
    if [ "$LANGUAGE" = "ruby"] && [  "$PLATFORM" = "discord"] then \
    ruby discord/ruby/bot.rb \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    ruby stdout/ruby/main.rb \
    if [ "$LANGUAGE" = "bash"] && [  "$PLATFORM" = "discord"] then \
    bash discord/bash/bot.sh \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    bash stdout/bash/main.sh \
    if [ "$LANGUAGE" = "crystal"] && [  "$PLATFORM" = "discord"] then \
    crystal discord/crystal/bot.cr \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    crystal stdout/crystal/main.cr \
    if [ "$LANGUAGE" = "dart"] && [  "$PLATFORM" = "discord"] then \
    dart discord/dart/bot.dart \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    echo "TOKEN is not set, using stdout" \
    dart stdout/dart/main.dart \
    if [ "$LANGUAGE" = "go"] && [  "$PLATFORM" = "discord"] then \
    go run discord/go/bot.go \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    go run stdout/go/main.go \
    if [ "$LANGUAGE" = "clojure"] && [  "$PLATFORM" = "discord"] then \
    clojure discord/clojure/bot.clj \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    clojure stdout/clojure/main.clj \
    if [ "$LANGUAGE" = "julia"] && [  "$PLATFORM" = "discord"] then \
    julia discord/julia/bot.jl \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    julia stdout/julia/main.jl \
    if [ "$LANGUAGE" = "nim"] && [  "$PLATFORM" = "discord"] then \
    nim discord/nim/bot.nim \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    nim stdout/nim/main.nim \
    if [ "$LANGUAGE" = "powershell"] && [  "$PLATFORM" = "discord"] then \
    pwsh discord/powershell/bot.ps1 \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    pwsh stdout/powershell/main.ps1 \
    if [ "$LANGUAGE" = "rust"] && [  "$PLATFORM" = "discord"] then \
    rustc discord/rust/bot.rs \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    rustc stdout/rust/main.rs \
    if [ "$LANGUAGE" = "swift"] && [  "$PLATFORM" = "discord"] then \
    swift discord/swift/bot.swift \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    swift stdout/swift/main.swift \
    if [ "$LANGUAGE" = "c"] && [  "$PLATFORM" = "discord"] then \
    gcc discord/c/bot.c \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    gcc stdout/c/main.c \
    if [ "$LANGUAGE" = "cpp"] && [  "$PLATFORM" = "discord"] then \
    g++ discord/cpp/bot.cpp \
    elif [ -z "$TOKEN"] || [    "$PLATFORM" = "stdout"] then \
    g++ stdout/cpp/main.cpp \
    else \
    echo "Language or platform not found" \
    fi




