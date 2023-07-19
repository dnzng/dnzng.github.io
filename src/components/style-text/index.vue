<template>
  <pre id="style-text" contenteditable v-html="text"></pre>
</template>

<script>
import { writeMixin } from '@/common/js/mixin.js'
import { handleChar } from '@/common/js/util.js'
import style0 from './style0.css?raw'
import style1 from './style1.css?raw'
import style2 from './style2.css?raw'

const styleText = [style0, style1, style2]

export default {
  name: 'StyleText',
  mixins: [writeMixin],
  methods: {
    async write(index) {
      await this.writeTo(this.$el, styleText[index], 0, this.speed, true, 1)
    },
    writeToEnd() {
      let txt = styleText.join('\n')
      let styleHTML = ''
      for (let i = 0; i < txt.length; i++) {
        styleHTML = handleChar(styleHTML, txt[i])
      }
      this.text = styleHTML
      this.$root.$emit('styleOverwrite', '#work-text * {transition: none; }' + txt)
    }
  }
}
</script>
