import sysRouter from '@ohos.router';

// pushNamedRoute 调用的时候需要引入
import './Home/HomePage';

import { MainPage, FTSLTool } from 'FirstTestStaticlibrary';

@Entry
@Component
struct Index {
  componentName = "Index"
  @Provide isJZPageShowConsume: boolean = false

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)

    //FTSLTool.haveFun();

    //let js = getInspectorByKey("onTap");
    //FIMXE: how about

    setTimeout(() => {
      let url = `pages/Swiper/Swiper`
      //let url = '@bundle:com.example.firsttest/FirstTestShareLibrary/ets/pages/ExportTestEntry'
      sysRouter.pushUrl({ url: url, params: null }, sysRouter.RouterMode.Standard, (err) => {
        if (err) {
          console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
          return;
        }
        console.info('Invoke pushUrl succeeded.');
      });
    }, 500)
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

  build() {
    Column() {
      Button("开始路由").onClick(() => {
        // import('ets/pages/Home/HomePage');

        // 1
        //FIXME:  为什么会失效?
        sysRouter.pushNamedRoute({ name: 'HomePage', params: null }, sysRouter.RouterMode.Standard, (err) => {
          if (err) {
            console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('Invoke pushUrl succeeded.');
        });

        // 2
        // //打开“entry > src > main > resources > base > profile”，在main_pages.json文件中的“src”下配置第二个页面的路由
        // sysRouter.pushUrl({ url: `pages/Home/HomePage`, params: null }, sysRouter.RouterMode.Standard, (err) => {
        //   if (err) {
        //     console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        //     return;
        //   }
        //   console.info('Invoke pushUrl succeeded.');
        // });

        // RouterOptions
        // let name = RouterOptions({ url: "", param: null} });
        // var options = sysRouter.RouterOptions({ });
        // sysRouter.pushUrl()
      })

      Button("路由到Animation").onClick(() => {
        sysRouter.pushUrl({ url: `pages/Animation/Animation`, params: null }, sysRouter.RouterMode.Standard, (err) => {
          if (err) {
            console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('Invoke pushUrl succeeded.');
        });
      })


      Button("路由到Canvas").onClick(() => {
        sysRouter.pushUrl({ url: `pages/Canvas/Canvas`, params: null }, sysRouter.RouterMode.Standard, (err) => {
          if (err) {
            console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('Invoke pushUrl succeeded.');
        });
      })
    }.justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center).width(`100%`).height(`100%`).key("onTap").id("onTap")

  }

  /// 异步方法
  async ccc() {
  }
}

export declare type NamedRouterOptions = sysRouter.NamedRouterOptions;

export declare type RouterOptions = sysRouter.RouterOptions;

export declare type RouterMode = sysRouter.RouterMode;

export declare type RouterState = sysRouter.RouterState;

export declare type EnableAlertOptions = sysRouter.EnableAlertOptions;