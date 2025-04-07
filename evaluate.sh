# export CUDA_VISIBLE_DEVICES=0,1,2,3
export CUDA_DEVICE_MAX_CONNECTIONS=1
# alias python='/root/.local/lib/python3.12'

export NCCL_TIMEOUT=99999


TOKENIZER_ARGS=(
    # --tokenizer-model /mnt/shimao-zhang-blob/models/Llama-3.1-8B
    --tokenizer-model /mnt/blob-hptrainingwesteurope-pretraining/Llama-3-8B
    --tokenizer-type HuggingFaceTokenizer
)

MODEL_ARGS=(
    --use-checkpoint-args
    --use-mcore-models
    --no-load-rng
    --bf16
    --tensor-model-parallel-size 1
    --load /mnt/blob-openpai-xiaoliuinterns/shimao_zhang/ckpts_from_others/llama_3B_data_evaluation_dclm_0215_tp1_core/
)

INFERENCE_SPECIFIC_ARGS=(
    --attention-dropout 0.0
    --hidden-dropout 0.0
    --micro-batch-size 3
    --results-path /mnt/shimao-zhang-blob/multi-mix/evaluation_results/zhtest_llama_3B_en100_0215.json
    # --task-list hellaswag,openbookqa,winogrande,arc_easy,arc_challenge,boolq,piqa,sciq,logiqa,lambada
    # --task-list gsm8k,mmlu_pro_math
    # --task-list math_continuation
    # --task-list mmlu_continuation,mmlu
    --task-list cmmlu
    --num-fewshot 5
    --trust-remote-code
)

# torchrun --nproc-per-node=4 evaluate.py \
#     ${TOKENIZER_ARGS[@]} \
#     ${MODEL_ARGS[@]} \
#     ${INFERENCE_SPECIFIC_ARGS[@]}

#  /root/.local/bin/accelerate launch evaluate.py \
#     ${TOKENIZER_ARGS[@]} \
#     ${MODEL_ARGS[@]} \
#     ${INFERENCE_SPECIFIC_ARGS[@]}

accelerate launch --main_process_port 29502 evaluate.py \
    ${TOKENIZER_ARGS[@]} \
    ${MODEL_ARGS[@]} \
    ${INFERENCE_SPECIFIC_ARGS[@]}
