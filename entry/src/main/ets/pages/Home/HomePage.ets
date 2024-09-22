import { router } from '@kit.ArkUI'

// import '@ohos/library/src/main/ets/pages/Index';
import { FrameNode, NodeController, RenderNode } from '@kit.ArkUI'
import { common2D, drawing } from '@kit.ArkGraphics2D'
import { print } from '@kit.BasicServicesKit'
import { promptAction } from '@kit.ArkUI'

/// 定义路由需要在resources/base/profile/main_pages.json中写路经
@Entry({
  routeName: `HomePage`
})
@Component
struct HomePage {
  componentName = "HomePage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }
  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }


  onAttach(callback: Callback<void, void>): CommonAttribute {
  //FIXME: 不生效的原因是什么
    return this
  }

  onDetach(callback: Callback<void, void>): CommonAttribute {
    return this
  }

  build() {
    Column() {
      Text("呵呵")
      Button("路由到My").onClick(() => {
        router.pushUrl({ url: "pages/My/My", params: null })
      }).onAttach(() => {

      }).onDetach(() => {
        promptAction.showToast({
          message: 'The text is hidden',
          duration: 2000,
          bottom: 500
        })
      })
    }
  }
}

