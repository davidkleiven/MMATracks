FOLDER=$1

cd $FOLDER

for fname in ./*.mma
do
    echo "Creating MIDI file for $fname"
    mma $fname
done

echo "Convert MIDI files"
timidity *.mid -Ow

echo "Converting to MP3"
soundconverter -b -m "audio/mpeg" -s ".mp3" ./*.wav
