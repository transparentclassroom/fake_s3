# Changelog

## Unreleased

## [0.12.0] - 2022-11-08

- fix bug w/ bucket.objects
- allow bucket.objects() to take prefix

## [0.11.0] - 2022-11-03

- add delete on object and delete_objects on bucket
- support ruby 3.0
- [#3](https://github.com/transparentclassroom/fake_s3/pull/3) Dependency updates

## [0.10.0] - 2020-10-30

### Added

- [#2](https://github.com/transparentclassroom/fake_s3/pull/2) Adds `#presigned_url` to `FakeS3::Object`

### Changed

- [#2](https://github.com/transparentclassroom/fake_s3/pull/2) BREAKING: Gets rid of `tc.com` portion of fake URL for `FakeS3::Object#public_url`
