FROM oven/bun
WORKDIR /app
COPY . .
RUN bun install
 
ARG PORT
EXPOSE ${PORT:-8001}
 
CMD ["bun", "src/index.ts"]