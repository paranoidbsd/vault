# vim: set ft=make ffs=unix fenc=utf8:
# vim: set noet ts=4 sw=4 tw=72 list:

BASE_DIR=/usr/local
INST_DIR=$(BASE_DIR)/sbin
DATA_DIR=$(BASE_DIR)/libdata/vault
CONF_DIR=$(BASE_DIR)/etc/vault

install: filecopy
	@sed -I "" -E -e 's~\%CONF_DIR\%~$(CONF_DIR)~' $(DATA_DIR)/vault.conf.subr
	@sed -I "" -E -e 's~\%DATA_DIR\%~$(DATA_DIR)~' $(INST_DIR)/vault

filecopy: directory vault vault.conf.subr vault.util.subr vault.conf.sample
	@install -C -S -o root -g wheel -m 0544 vault $(INST_DIR)/vault
	@install -C -S -o root -g wheel -m 0444 vault.conf.subr $(DATA_DIR)/vault.conf.subr
	@install -C -S -o root -g wheel -m 0444 vault.util.subr $(DATA_DIR)/vault.util.subr
	@install -C -S -o root -g wheel -m 0640 vault.conf.sample $(CONF_DIR)/vault.conf.sample

directory:
	@install -d -o root -g wheel $(DATA_DIR)
	@install -d -o root -g wheel $(CONF_DIR)
