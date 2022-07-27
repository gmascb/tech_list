# Pin npm packages by running ./bin/importmap

pin_all_from "app/javascript/controllers", under: "controllers"

# Pin all vuejs Components
pin_all_from "app/javascript/components", under: "components"

pin "application", preload: true

=begin

./bin/importmap pin vue@next --download

=> will create...
pin "@vue/reactivity", to: "https://ga.jspm.io/npm:@vue/reactivity@3.2.29/dist/reactivity.esm-bundler.js"
pin "@vue/runtime-core", to: "https://ga.jspm.io/npm:@vue/runtime-core@3.2.29/dist/runtime-core.esm-bundler.js"
pin "@vue/runtime-dom", to: "https://ga.jspm.io/npm:@vue/runtime-dom@3.2.29/dist/runtime-dom.esm-bundler.js"
pin "@vue/shared", to: "https://ga.jspm.io/npm:@vue/shared@3.2.29/dist/shared.esm-bundler.js"

OR 
./bin/importmap pin vue@next

=> will create
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.29/dist/vue.runtime.esm-bundler.js"

=end

#pin "lala", to: "https://ga.jspm.io/npm:vue@3.2.29/dist/vue.runtime.esm-bundler.js"

pin "vue", to: "https://cdn.delivr.net/npm/vue@2.6.14/dist/vue.esm.browser.js"
