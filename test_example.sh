#!/bin/bash

# Parameters
BIT_PATTERN="01101100101101001100"
CARRIER_FREQUENCY=1000  # in Hz
AMPLITUDE=1             # Carrier amplitude
BIT_DURATION=50         # Duration of each bit in milliseconds
SAMPLING_RATE=10000     # Samples per second

# Calculate the number of samples per bit
SAMPLES_PER_BIT=$((BIT_DURATION * SAMPLING_RATE / 1000))

# Initialize time and signal arrays
times=()
signals=()

# Generate the ASK signal based on the bit pattern
for ((i = 0; i < ${#BIT_PATTERN}; i++)); do
    bit=${BIT_PATTERN:i:1}
    for ((j = 0; j < SAMPLES_PER_BIT; j++)); do
        t=$((i * BIT_DURATION * SAMPLING_RATE / 1000 + j))
        if [[ $bit -eq 1 ]]; then
            # Generate the carrier signal
            value=$(echo "$AMPLITUDE * s($CARRIER_FREQUENCY * 2 * 3.14159 * $t / $SAMPLING_RATE)" | bc -l)
        else
            # Silence for bit 0
            value=0
        fi
        times+=($t)
        signals+=($value)
    done
done

# Output data to a file
output_file="ask_signal.dat"
> $output_file
for ((i = 0; i < ${#times[@]}; i++)); do
    echo "${times[i]} ${signals[i]}" >> $output_file
done

# Generate plot using gnuplot and save it to a file
plot_file="ask_signal.png"
gnuplot <<- EOF
    set title "ASK (On-Off Keying) Signal"
    set xlabel "Time (milliseconds)"
    set ylabel "Amplitude"
    set grid
    set terminal png size 1024,768
    set output "$plot_file"
    plot "$output_file" using (\$1/$SAMPLING_RATE*1000):2 with lines title 'ASK Signal'
EOF

echo "ASK simulation completed and plot saved to $plot_file."
