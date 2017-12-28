# Is it a banger?

## TODOs

### Data pipeline

- `split_files.sh` to do training and test, positive and negative examples.

- ipython notebook to load individual files into TensorFlow, with labels corresponding to location, i.e. positive or negative

- First try model with `identity` applied to batches, to check data pipeline correct.

- Maybe script that takes corpus of good/bad examples, then splits into training and test sets

### Analysis

- Convert audio samples to log spectrogram.

- Will probably have to downsample a lot.

- Think about structural properties that can allow us to eliminate nodes.

### Learning

- Convolutional net (will need to experiment!)

- Cross-validation?

- Look into how others have looked at audio data?

## Other Models?

- Maybe use SVM, $k$-NN with `sklearn` on data?