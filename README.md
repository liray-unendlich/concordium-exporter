# concordium-exporter

[![Release Go Project/Release ghcr image](https://github.com/liray-unendlich/concordium-exporter/actions/workflows/release-image.yml/badge.svg)](https://github.com/liray-unendlich/concordium-exporter/actions/workflows/release-image.yml)

## Example

```bash
./concordium-exporter
```

It connects your concordium-node and serves HTTP API on port(9360) for prometheus, connect localhost:10000 for concordium-node gRPC server.

Other example,

ex.1: port, url, password changed

```bash
./concordium-exporter -hport 9366 -url localhost:10211 -pwd rpcadmin
```

It serves API on 9366, connect concordium-node with localhost:10211, and it uses authentication password as rpcadmin.

ex.2: docker

```bash
docker pull ghcr.io/liray-unendlich/concordium-exporter
docker run -d --net="host" -p 9360:9360 liray-unendlich/concordium-exporter
```

## Serving Information

It serves these information.

| name                         | outline                                      |
| ---------------------------- | -------------------------------------------- |
| best_block_height            | Best block number                            |
| last_finalized_block_height  | Latest finalized block number                |
| finalization_period_inEMA    | duration per finalization[s](EMA)            |
| epoch_duration               | duration per epoch[s]                        |
| slot_duration                | duration per slot[s]                         |
| peer_total_sent_amount       | Packets your node sent to peer in Byte       |
| peer_total_receive_amount    | Packets your node received from peer in Byte |
| block_arrive_latency_inEMA   | Latency of block arrival(EMA)                |
| block_arrive_period_inEMA    | duration per arriving block[s](EMA)          |
| block_receive_latency_inEMA  | Latency of block receiving(EMA)              |
| block_receive_period_inEMA   | duration per receiving block[s](EMA)         |
| transactions_per_block_inEMA | Transaction per block(EMA)                   |
