# Is it a banger?

## TODOs

`tf.set_random_seed(1234)`

### Data pipeline

- [ X ] `split_files.sh` to do training and test, positive and negative examples. Will split training and test in code.

- [ X ] python script to load individual files into TFRecords format? Will try all data in notebook for now... Use pandas dataframe then pickle. Sample some proportion of data  uniformly at random to save space and so that there are fewer correlations in training data.

- [ X ] Continue working with notebook from `aqibsaeed`. Move on to `dk1027` notebook.

- First try model with `identity` applied to batches, to check data pipeline correct.

- youtube links include bangers, "selected, blanc" channels. not\_a\_banger is lumineers, enya, cliff richard haha

### Analysis

- [ X ] Convert audio samples to log spectrogram.

- Will probably have to downsample a lot.

- Think about structural properties that can allow us to eliminate nodes.

- librosa features?

- Comment on a better way to store the data?

### Learning

- Convolutional net (will need to experiment!)

- Cross-validation?

- Look into how others have looked at audio data?

## Other Models?

- Maybe use SVM, $k$-NN with `sklearn` on data?
