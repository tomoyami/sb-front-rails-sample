<template>
  <div>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: () => ({
    message: 'Hello Vue!'
  })
}
</script>

<style scoped>
p {
  color: #f00;
  font-size: 2em;
}
</style>
