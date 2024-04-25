FROM pypiserver/pypiserver:v2.1.1
# No password (-P .), no authentication (-a .)
CMD ["-P", ".", "-a", ".", "/data/packages"]
