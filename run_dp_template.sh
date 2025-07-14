export HCCL_IF_IP=your_ip_address_here
export GLOO_SOCKET_IFNAME="enp48s3u1u1"
export TP_SOCKET_IFNAME="enp48s3u1u1"
export HCCL_SOCKET_IFNAME="enp48s3u1u1"
export DISAGGREGATE_PREFILL_RANK_TABLE_PATH=your_rank_table_path_here
export VLLM_LOGGING_LEVEL="debug"
export OMP_PROC_BIND=false
export VLLM_DP_SIZE=$1
export VLLM_DP_MASTER_ADDR=$2
export VLLM_DP_MASTER_PORT=$3
export VLLM_DP_RANK_LOCAL=$4
export VLLM_DP_RANK=$5


export VLLM_USE_V1=1

export ASCEND_RT_VISIBLE_DEVICES=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

vllm serve model_path \
    --host 0.0.0.0 \
    --port 8000 \
    --tensor-parallel-size 2 \
    --enable-expert-parallel \
    --seed 1024 \
    --served-model-name dsv3 \
    --max-model-len 2048 \
    --max-num-batched-tokens 2048 \
    --trust-remote-code \
    --gpu-memory-utilization 0.9 \
    --enforce-eager-mode \
    --kv-transfer-config \
    '{"kv_connector": "LLMDataDistCMgrConnector",
      "kv_buffer_device": "npu",
      "kv_role": "kv_consumer",
      "kv_parallel_size": "1",
      "kv_port": "20001",
      "engine_id": "0",
      kv_connector_module_path: "vllm_ascend.distributed.llmdatadist_c_mgr_connector"
    }' \
