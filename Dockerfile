FROM pypiserver/pypiserver:v2.0.0
# No password (-P .), no authentication (-a .)
CMD ["-P", ".", "-a", ".", "/data/packages"]
