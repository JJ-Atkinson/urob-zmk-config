# Build file just for me focusing on cradio

podman run --rm\
    --mount type=bind,source=/home/jarrett/code/personal/zmk,target=/workspace/zmk \
    --mount type=bind,source=/home/jarrett/code/personal/urob-zmk-config,target=/workspace/zmk-config,readonly \
    --mount type=volume,source=zmk-root-user-3.5,target=/root \
    --mount type=volume,source=zmk-zephyr-3.5,target=/workspace/zmk/zephyr \
    --mount type=volume,source=zmk-zephyr-modules-3.5,target=/workspace/zmk/modules \
    --mount type=volume,source=zmk-zephyr-tools-3.5,target=/workspace/zmk/tools \
    -w /workspace/zmk/app zmkfirmware/zmk-dev-arm:3.5 \
    west build -s /workspace/zmk/app -d "build/nice_nano_v2_3.5_docker_left" -b nice_nano_v2 \
    -- -DZMK_CONFIG="/workspace/zmk-config/config" -DSHIELD="cradio_left"

mv /home/jarrett/code/personal/zmk/app/build/nice_nano_v2_3.5_docker_left/zephyr/zmk.uf2 /home/jarrett/code/personal/urob-zmk-config/results/cradio_left.u2f

podman run --rm\
    --mount type=bind,source=/home/jarrett/code/personal/zmk,target=/workspace/zmk \
    --mount type=bind,source=/home/jarrett/code/personal/urob-zmk-config,target=/workspace/zmk-config,readonly \
    --mount type=volume,source=zmk-root-user-3.5,target=/root \
    --mount type=volume,source=zmk-zephyr-3.5,target=/workspace/zmk/zephyr \
    --mount type=volume,source=zmk-zephyr-modules-3.5,target=/workspace/zmk/modules \
    --mount type=volume,source=zmk-zephyr-tools-3.5,target=/workspace/zmk/tools \
    -w /workspace/zmk/app zmkfirmware/zmk-dev-arm:3.5 \
    west build -s /workspace/zmk/app -d "build/nice_nano_v2_3.5_docker_right" -b nice_nano_v2 \
    -- -DZMK_CONFIG="/workspace/zmk-config/config" -DSHIELD="cradio_right"

mv /home/jarrett/code/personal/zmk/app/build/nice_nano_v2_3.5_docker_right/zephyr/zmk.uf2 /home/jarrett/code/personal/urob-zmk-config/results/cradio_right.u2f
