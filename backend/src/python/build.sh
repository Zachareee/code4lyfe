cd handlers
for i in *.py; do 
    name=${i%%\.py}
    mkdir -p ../../../output/$name
    python -m pip install -r ../requirements.txt --target ../../../output/$name && cp $i ../../../output/$name/index.py
done