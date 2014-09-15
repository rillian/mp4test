ENCODER ?= ${HOME}/projects/ffmpeg/ffmpeg

SRCS := 720p5994_stockholm_ter.y4m

BASE := stockholm
TARGETS := $(BASE)-baseline-3.0.mp4 \
	   $(BASE)-baseline-3.1.mp4 \
	   $(BASE)-main-3.1.mp4 \
	   $(BASE)-main-4.0.mp4 \
	   $(BASE)-high-4.0.mp4 \
	   $(BASE)-high-4.1.mp4 \
	   $(BASE)-high-4.2.mp4 \
	   $(BASE)-high-5.0.mp4 \
	   $(BASE)-high-5.1.mp4 \
	   $(BASE)-high-5.2.mp4 \

all: $(TARGETS)

clean:
	$(RM) $(TARGETS)

stockholm-baseline-3.0.mp4: FLAGS := -profile:v baseline -level 3.0
stockholm-baseline-3.1.mp4: FLAGS := -profile:v baseline -level 3.1
stockholm-main-3.1.mp4: FLAGS := -profile:v main -level 3.1
stockholm-main-4.0.mp4: FLAGS := -profile:v main -level 4.0
stockholm-high-4.0.mp4: FLAGS := -profile:v high -level 4.0
stockholm-high-4.1.mp4: FLAGS := -profile:v high -level 4.1
stockholm-high-4.2.mp4: FLAGS := -profile:v high -level 4.2
stockholm-high-5.0.mp4: FLAGS := -profile:v high -level 5.0
stockholm-high-5.1.mp4: FLAGS := -profile:v high -level 5.1
stockholm-high-5.2.mp4: FLAGS := -profile:v high -level 5.2

%.mp4 : $(SRCS)
	$(ENCODER) -i $< -c:v libx264 $(FLAGS) -f mp4 -s 640x350 -crf 23 $@

# fetch source videos
$(SRCS):
	curl -O https://media.xiph.org/video/derf/y4m/$@
