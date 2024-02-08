FROM pypiserver/pypiserver:v1.5.2
# No password (-P .), no authentication (-a .)
# Use sha256 instead of md5: https://stackoverflow.com/a/73620697/735926
CMD ["-P", ".", "-a", ".", "--hash-algo", "sha256", "/data/packages"]
