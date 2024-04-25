FROM pypiserver/pypiserver:v2.1.0
# No password (-P .), no authentication (-a .)
CMD ["-P", ".", "-a", ".", "/data/packages"]
