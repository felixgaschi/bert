BERT_BASE_DIR=/data0/weights/multi_cased_L-12_H-768_A-12
SQUAD_DIR=/data0/squad
OUTPUT_DIR=/data0/experiments/squad-biases

create-env:
		conda create -n bert-env python=3.7 && conda activate bert-env && pip install --user -r requirements.txt

train-1:
		python run_squad.py \
			--vocab_file=$(BERT_BASE_DIR)/vocab.txt \
			--bert_config_file=$(BERT_BASE_DIR)/bert_config.json \
			--init_checkpoint=$(BERT_BASE_DIR)/bert_model.ckpt \
			--do_train=True \
			--train_file=$(SQUAD_DIR)/train-v1.1.json \
			--do_predict=True \
			--predict_file=$(SQUAD_DIR)/dev-v1.1.json \
			--train_batch_size=12 \
			--learning_rate=3e-5 \
			--num_train_epochs=20 \
			--max_seq_length=384 \
			--doc_stride=128 \
			--do_lower_case=False \
			--output_dir=$(OUTPUT_DIR)/bert_base_squad1.1